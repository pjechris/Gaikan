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
}
