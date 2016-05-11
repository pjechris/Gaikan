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
public struct Style : DictionaryLiteralConvertible {
    internal private(set) var style: StyleRule
    internal private(set) var states: [StyleState:StyleRule] = [:]

    public init(dictionaryLiteral elements: (StyleRule.Key, StyleRule.Value)...) {
        var attributes = Dictionary<StyleRule.Key, StyleRule.Value>()

        for (attributeName, attributeValue) in elements {
            attributes[attributeName] = attributeValue
        }

        self.init(style: StyleRule(attributes: attributes))
    }

    public init(_ styleBlock: (inout style: StyleRule) -> ()) {
        self.init(style: StyleRule(styleBlock))
    }

    private init(style: StyleRule) {
        self.style = style
    }

    public func state(state: StylePseudoState, styleRule styleBlock: (inout style: StyleRule) -> ()) -> Style {
        return self.state(.PseudoState(state), styleRule: styleBlock)
    }

    internal func state(state: StyleState, styleRule styleBlock: (inout style: StyleRule) -> ()) -> Style {
        var style = self

        style.states[state] = StyleRule(styleBlock)

        return style
    }

    public func state(state: String, styleRule styleBlock: (inout style: StyleRule) -> ()) -> Style {
        return self.state(.Custom(state), styleRule: styleBlock)
    }

    public func state(state: StylePseudoState, _ attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        return self.state(.PseudoState(state), attributes: attributes)
    }

    public func state(state: String, _ attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        return self.state(.Custom(state), attributes: attributes)
    }

    internal func state(state: StyleState, attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        var style = self

        style.states[state] = StyleRule(attributes: attributes)

        return style
    }

    internal subscript(state: StylePseudoState) -> StyleRule? {
        get { return self.states[.PseudoState(state)] }
    }

    internal subscript(state: String) -> StyleRule? {
        get { return self.states[.Custom(state)] }
    }
}