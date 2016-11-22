//
// This file is part of Gaikan
//
// Created by JC on 24/06/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension Dictionary where Key : Any, Value : OptionalProtocol, Value.WrappedType : AnyObject {
    typealias Wrapped = Value.WrappedType

    func trimmed() -> [Key:Wrapped] {
        var dict = [Key:Wrapped]()

        for (key, value) in self {
            if let value = value.value {
                dict[key] = value
            }
        }

        return dict
    }
}

extension Dictionary {
    @discardableResult
    mutating func gaikan_merge(_ dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
        for (key, value) in dictionary {
            self.updateValue(value, forKey: key)
        }

        return self
    }
}
