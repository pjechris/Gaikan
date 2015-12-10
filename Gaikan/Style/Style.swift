//
// This file is part of Gaikan
//
// Created by JC on 11/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

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
        var style = self

        style.states[.PseudoState(state)] = StyleRule(styleBlock)

        return style
    }

    public func include(state: StylePseudoState, attributes: [StyleRule.Key:StyleRule.Value]) -> Style {
        var style = self

        style.states[.PseudoState(state)] = StyleRule(attributes: attributes)

        return style
    }
}