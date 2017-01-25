//
// This file is part of Gaikan
//
// Created by JC on 05/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public typealias BorderStyle = (width: CGFloat, color: UIColor)

/**
 Represents `Border` property
 */

public struct Border : Equatable {
    var sides: [Side: BorderStyle]

    public init(_ side: Side, style: BorderStyle) {
        self.init(sides: [side], style: style)
    }

    public init(all style: BorderStyle) {
        self.init(sides: [.top, .right, .bottom, .left], style: style)
    }

    public init(sides: [Side], style: BorderStyle) {
        var allSides = [Side:BorderStyle]()

        for side in sides {
            allSides[side] = style
        }

        self.sides = allSides
    }

    public func stylize(_ side: Side, with style: BorderStyle) -> Border {
        var newBorder = self

        newBorder.sides[side] = style

        return newBorder
    }
}

public func ==(lhs: Border, rhs: Border) -> Bool {
    for (key, lvalue) in lhs.sides {
        guard let rvalue = rhs.sides[key] else {
            return false
        }

        guard lvalue.width == rvalue.width, lvalue.color == rvalue.color else {
            return false
        }
    }

    return true
}
