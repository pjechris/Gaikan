//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
 *  Defines design properties with their values.
 */
public struct StyleRule : ExpressibleByDictionaryLiteral {
    public typealias Key = Property
    public typealias Value = Any?

    var attributes : Dictionary<Key, Value>

    public init(attributes: [Key:Value]) {
        self.attributes = attributes
    }

    public init(dictionaryLiteral elements: (Key, Value)...) {
        var attributes = Dictionary<Key, Value>()

        for (attributeName, attributeValue) in elements {
            attributes[attributeName] = attributeValue
        }

        self.attributes = attributes
    }

    public init(_ styleBlock: (_ style: inout StyleRule) -> ()) {
        self.init(attributes: [:])

        styleBlock(&self)
    }

    public func extends(_ styles: StyleRule?...) -> StyleRule {
        var composedAttributes: [Key:Value] = [:]

        for style in styles {
            if let styleAttributes = style?.attributes  {
                composedAttributes.gaikan_merge(styleAttributes)
            }
        }

        return StyleRule(attributes: composedAttributes.gaikan_merge(self.attributes))
    }

    subscript(keyname: Property) -> Value {
        get { return self.attributes[keyname] != nil ? self.attributes[keyname]! : nil }
    }
}

extension StyleRule {
    public var textAttributes: [String:AnyObject] {
        let attributes: [String:AnyObject?] = [
            NSForegroundColorAttributeName: self.color,
            NSFontAttributeName: self.font,
            NSShadowAttributeName: self.textShadow
        ]

        return attributes.trimmed()
    }
}
