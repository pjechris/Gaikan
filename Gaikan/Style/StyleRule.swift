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

    private let attributes : Dictionary<Key, Value>

    public init(dictionaryLiteral elements: (Key, Value)...) {
        var attributes = Dictionary<Key, Value>()

        for (attributeName, attributeValue) in elements {
            attributes[attributeName] = attributeValue
        }

        self.attributes = attributes
    }

    private subscript(keyname: StyleProperty) -> Any? {
        get { return self.attributes[keyname] }
    }
}

public extension StyleRule {
    public var color : UIColor? {
        get { return self.attributes[.Color].map { return $0 as! UIColor } }
    }

    public var tintColor : UIColor? {
        get { return self.attributes[.TintColor].map { return $0 as! UIColor } }
    }

    public var visible : Bool {
        get { return self.attributes[.Visible].map { return $0 as! Bool } ?? true }
    }
}