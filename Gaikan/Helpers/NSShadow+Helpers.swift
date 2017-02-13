//
//  NSShadow+Helpers.swift
//  Gaikan
//
//  Created by pjechris on 07/02/17.
//  Copyright © 2017 fr.akane. All rights reserved.
//

import Foundation

extension NSShadow {
    public convenience init(offset: CGSize, radius: CGFloat, color: UIColor?) {
        self.init()

        self.shadowOffset = offset
        self.shadowBlurRadius = radius
        self.shadowColor = color
    }
}
