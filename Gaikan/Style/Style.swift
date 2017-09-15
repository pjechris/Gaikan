//
// This file is part of Gaikan
//
// Created by JC on 11/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public enum State {
    case normal
    case disabled
    case focused
}

struct Variant {
    let state: State?
    let trait: UITraitCollection?

    static let `default` = Variant(state: nil, trait: nil)
}

extension Variant : Hashable {
    var hashValue: Int {
        return (self.state?.hashValue ?? 0) ^ (self.trait?.hashValue ?? 0)
    }

    static func ==(lhs: Variant, rhs: Variant) -> Bool {
        return lhs.state == rhs.state && lhs.trait == rhs.trait
    }
}

/**
 *  Defines a `StyleRule` on which you can apply supplemntary `StylePseudoState` states.
 */
public struct Style {
    internal var defaultVariant: Properties {
        get { return self.variants[Variant.default]! }
        set { self.variants[Variant.default] = newValue }
    }
    internal var variants: [Variant:Properties] = [:]

    public init() {
        self.defaultVariant = Properties()
    }

    public func styled(with modifier: (inout Properties) -> Void) -> Style {
        var newStyle = self

        modifier(&newStyle.defaultVariant)

        return newStyle
    }

    public func properties(for state: State = .normal, _ trait: UITraitCollection) -> Properties {
        var props = self.defaultVariant

        if let traitProps = self.variants[Variant(state: nil, trait: trait)] {
            props.applies(traitProps)
        }

        if let stateProps = self.variants[Variant(state: state, trait: nil)] {
            props.applies(stateProps)

        }

        if let variantProps = self.variants[Variant(state: state, trait: trait)] {
            props.applies(variantProps)
        }
        
        return props
    }
}

extension Style {
    public func styled(for state: State, _ trait: UITraitCollection, with modifier: (inout Properties) -> Void) -> Style {
        return self.styled(variant: Variant(state: state, trait: trait), modifier: modifier)
    }

    public func styled(for state: State, with modifier: (inout Properties) -> Void) -> Style {
        return self.styled(variant: Variant(state: state, trait: nil), modifier: modifier)
    }

    public func styled(for trait: UITraitCollection, modifier: (inout Properties) -> Void) -> Style {
        return self.styled(variant: Variant(state: nil, trait: trait), modifier: modifier)
    }

    fileprivate func styled(variant: Variant, modifier: (inout Properties) -> Void) -> Style {
        var newStyle = self
        var properties = self.variants[variant] ?? Properties()

        modifier(&properties)
        newStyle.variants[variant] = properties

        return newStyle
    }
}
