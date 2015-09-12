//
// This file is part of Gaikan
//
// Created by JC on 12/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

internal extension Dictionary {
    mutating func gaikan_merge(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
        for (key, value) in dictionary {
            self.updateValue(value, forKey: key)
        }

        return self
    }
}