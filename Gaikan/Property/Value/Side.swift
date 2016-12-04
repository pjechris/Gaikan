//
//  Side.swift
//  Gaikan
//
//  Created by pjechris on 04/12/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

public enum Side : String {
    case top
    case right
    case bottom
    case left

    public static var all: Set<Side> {
        return [.top, .right, .bottom, .left]
    }
}

extension Side : Hashable {
    public var hashValue: Int {
        return self.rawValue.hashValue
    }
}

//extension Side : Hashable {
//    public var hashValue: Int {
//        switch (self) {
//        case .top(_):
//            return "top".hashValue
//        case .right(_):
//            return "right".hashValue
//        case .bottom(_):
//            return "bottom".hashValue
//        case .left(_):
//            return "left".hashValue
//        }
//    }
//}
//
//public func ==<T>(lhs: Side<T>, rhs: Side<T>) -> Bool {
//    return lhs.hashValue == rhs.hashValue
//}
