//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct StyleRule : DictionaryLiteralConvertible {
    public typealias Key = StyleProperty
    public typealias Value = Any?

    private var attributes : Dictionary<Key, Value>

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

    public mutating func extends(styles: StyleRule?...) -> StyleRule {
        var composedAttributes: [Key:Value] = [:]

        for style in styles {
            if let styleAttributes = style?.attributes  {
                composedAttributes.gaikan_merge(styleAttributes)
            }
        }

        self.attributes = composedAttributes.gaikan_merge(self.attributes)
        return self
    }

    private subscript(keyname: StyleProperty) -> Value {
        get { return self.attributes[keyname] != nil ? self.attributes[keyname]! : nil }
    }
}

public extension StyleRule {
    public var border: Border {
        get { return self[.Border].map { return $0 as! Border } ?? Border(width: 0, color: nil) }
    }

    public var color: UIColor? {
        get { return self[.Color].map { return $0 as! UIColor } }
    }

    public var font: UIFont? {
        get { return self[.Font].map { return $0 as! UIFont } }
    }

    public var tintColor: UIColor? {
        get { return self[.TintColor].map { return $0 as! UIColor } }
    }

    public var visible: Bool {
        get { return self[.Visible].map { return $0 as! Bool } ?? true }
    }
}