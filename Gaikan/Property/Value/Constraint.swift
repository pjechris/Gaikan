//
//  Constraint.swift
//  Gaikan
//
//  Created by pjechris on 29/08/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation


public struct Constraint {
    public let constant: Double
    public var priority = UILayoutPriorityRequired

    public init(constant: Double) {
        self.constant = constant
    }
}

extension Constraint : ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(constant: value)
    }

    public init(integerLiteral value: IntegerLiteralType) {
        self.init(constant: Double(value))
    }
}

infix operator ~

public func ~ (lhs: inout Constraint, rhs: UILayoutPriority) -> Constraint {
    lhs.priority = rhs

    return lhs
}
