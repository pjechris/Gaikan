//
//  NSLayoutAttribute+Helpers.swift
//  Gaikan
//
//  Created by pjechris on 01/09/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

extension NSLayoutAttribute {
    func identifier() -> String {
        switch(self) {
        case .lastBaseline:
            return "baseline"
        case .bottom:
            return "bottom"
        case .bottomMargin:
            return "bottomMargin"
        case .centerX:
            return "centerX"
        case .centerXWithinMargins:
            return "centerXWithinMargins"
        case .centerY:
            return "centerY"
        case .centerYWithinMargins:
            return "centerYWithinMargins"
        case .firstBaseline:
            return "firstBaseline"
        case .height:
            return "height"
        case .leading:
            return "leading"
        case .leadingMargin:
            return "leadingMargin"
        case .left:
            return "left"
        case .leftMargin:
            return "leftMargin"
        case .notAnAttribute:
            return "notAnAttribute"
        case .right:
            return "right"
        case .rightMargin:
            return "rightMargin"
        case .top:
            return "top"
        case .topMargin:
            return "topMargin"
        case .trailing:
            return "trailing"
        case .trailingMargin:
            return "trailingMargin"
        case .width:
            return "width"
        }
    }
}
