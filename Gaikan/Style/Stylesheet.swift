//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct Stylesheet: DictionaryLiteralConvertible {
    public typealias Key = String
    public typealias Value = StyleRule

    public let styles : Dictionary<Key, Value>

    public init(dictionaryLiteral elements: (Key, Value)...) {
        var styles = Dictionary<Key, Value>()

        for (key, value) in elements {
            styles[key] = value
        }

        self.styles = styles
    }

    public subscript(keyname: String?) -> StyleRule? {
        get { return (keyname != nil) ? self.styles[keyname!] : nil }
    }
}
