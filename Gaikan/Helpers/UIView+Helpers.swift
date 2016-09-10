//
//  UIView+Helpers.swift
//  Gaikan
//
//  Created by pjechris on 10/09/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

extension UIView {
    struct Keys {
        static var Dimension = "DimensionAttr"
    }

    var dimensions: [NSLayoutConstraint] {
        get {
            guard let constraints = objc_getAssociatedObject(self, &Keys.Dimension) as? [NSLayoutConstraint] else {
                self.dimensions = []
                return self.dimensions
            }

            return constraints
        }
        set { objc_setAssociatedObject(self, &Keys.Dimension, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}