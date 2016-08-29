//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension CGPoint {
    public static func topLeft() -> CGPoint {
        return CGPoint(x: 0, y: 0)
    }

    public static func topRight() -> CGPoint {
        return CGPoint(x: 1, y: 1)
    }

    public static func bottomLeft() -> CGPoint {
        return CGPoint(x: 0, y: 1)
    }

    public static func bottomRight() -> CGPoint {
        return CGPoint(x: 1, y: 1)
    }

    public static func top() -> CGPoint {
        return CGPoint(x: 0.5, y: 0)
    }

    public static func bottom() -> CGPoint {
        return CGPoint(x: 0.5, y: 1)
    }
}