//
// This file is part of Gaikan
//
// Created by JC on 25/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
    Code for AssociationObject using Swift types
    From https://wezzard.com/2015/10/09/associated-object-and-swift-struct
**/
internal final class AssociatedObject<T> : NSObject, NSCopying {
    typealias AssociatedType = T
    let value: AssociatedType

    required init(_ value: AssociatedType) {
        self.value = value
    }

    func copy(with zone: NSZone?) -> Any {
        return AssociatedObject(self.value)
    }
}

extension AssociatedObject where T:NSCopying {
    func copyWithZone(_ zone: NSZone?) -> AnyObject {
        return AssociatedObject(value.copy(with: zone) as! AssociatedType)
    }
}
