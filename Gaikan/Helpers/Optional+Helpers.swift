//
// This file is part of Gaikan
//
// Created by JC on 24/06/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

protocol OptionalProtocol {
    associatedtype WrappedType

    var value: WrappedType? { get }
}

extension Optional: OptionalProtocol {

    var value: Wrapped? {
        return self
    }
}
