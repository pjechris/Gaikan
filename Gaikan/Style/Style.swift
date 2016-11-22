//
// This file is part of Gaikan
//
// Created by JC on 11/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
 *  Defines a `StyleRule` on which you can apply supplemntary `StylePseudoState` states.
 */
public struct Style : ExpressibleByDictionaryLiteral {
    internal fileprivate(set) var style: StyleRule
    internal fileprivate(set) var states: [StyleState:StyleRule] = [:]

    public init(dictionaryLiteral elements: (StyleRule.Key, StyleRule.Value)...) {
        var attributes = Dictionary<StyleRule.Key, StyleRule.Value>()

        for (attributeName, attributeValue) in elements {
            attributes[attributeName] = attributeValue
        }

        self.init(style: StyleRule(attributes: attributes))
    }

    public init(_ styleBlock: (_ style: inout StyleRule) -> ()) {
        self.init(style: StyleRule(styleBlock))
    }

    fileprivate init(style: StyleRule) {
        self.style = style
    }

    public func state(_ state: StylePseudoState, styleRule styleBlock: (_ style: inout StyleRule) -> ()) -> Style {
        return self.state(.pseudoState(state), styleRule: styleBlock)
    }

    internal func state(_ state: StyleState, styleRule styleBlock: (_ style: inout StyleRule) -> ()) -> Style {
        var style = self

        style.states[state] = StyleRule(styleBlock)

        return style
    }

    public func state(_ state: String, styleRule styleBlock: (_ style: inout StyleRule) -> ()) -> Style {
        return self.state(.custom(state), styleRule: styleBlock)
    }

    public func state(_ state: StylePseudoState, _ attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        return self.state(.pseudoState(state), attributes: attributes)
    }

    public func state(_ state: String, _ attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        return self.state(.custom(state), attributes: attributes)
    }

    internal func state(_ state: StyleState, attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        var style = self

        style.states[state] = StyleRule(attributes: attributes)

        return style
    }

    internal subscript(state: StylePseudoState) -> StyleRule? {
        get { return self.states[.pseudoState(state)] }
    }

    internal subscript(state: String) -> StyleRule? {
        get { return self.states[.custom(state)] }
    }
}
