//
//  BackgroundLayer.swift
//  Gaikan
//
//  Created by pjechris on 01/12/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

class BackgroundLayer : CALayer {
    var background: Background? {
        didSet {
            self.setNeedsDisplay()
        }
    }

    override func draw(in ctx: CGContext) {
        guard let background = self.background else {
            return
        }

        UIGraphicsPushContext(ctx)

        for bg in Background(background).backgrounds {
            bg.render(inContext: ctx)
        }

        UIGraphicsPopContext()
    }
}
