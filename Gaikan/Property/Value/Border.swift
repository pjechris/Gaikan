//
//  Border.swift
//  Gaikan
//
//  Created by JC on 05/09/15.
//  Copyright © 2015 fr.akane. All rights reserved.
//

import Foundation

public struct Border {
    public let width: CGFloat
    public let color: UIColor?

    public init(width: CGFloat, color: UIColor?) {
        self.width = width
        self.color = color
    }
}