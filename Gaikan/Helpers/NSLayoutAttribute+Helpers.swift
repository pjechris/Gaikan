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
        case .LastBaseline:
            return "baseline"
        case .Bottom:
            return "bottom"
        case .BottomMargin:
            return "bottomMargin"
        case .CenterX:
            return "centerX"
        case .CenterXWithinMargins:
            return "centerXWithinMargins"
        case .CenterY:
            return "centerY"
        case .CenterYWithinMargins:
            return "centerYWithinMargins"
        case .FirstBaseline:
            return "firstBaseline"
        case .Height:
            return "height"
        case .Leading:
            return "leading"
        case .LeadingMargin:
            return "leadingMargin"
        case .Left:
            return "left"
        case .LeftMargin:
            return "leftMargin"
        case .NotAnAttribute:
            return "notAnAttribute"
        case .Right:
            return "right"
        case .RightMargin:
            return "rightMargin"
        case .Top:
            return "top"
        case .TopMargin:
            return "topMargin"
        case .Trailing:
            return "trailing"
        case .TrailingMargin:
            return "trailingMargin"
        case .Width:
            return "width"
        }
    }
}
