//
//  BorderLayer.swift
//  Gaikan
//
//  Created by pjechris on 30/11/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

class BorderLayer : CALayer {
    var border: Border? {
        didSet { self.setNeedsDisplay() }
    }

    override func draw(in ctx: CGContext) {
        guard let border = self.border else {
            return
        }

        let path = UIBezierPath()

        UIGraphicsPushContext(ctx)

        // TOP
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: ctx.width, y: 0))
        path.addLine(to: CGPoint(x: ctx.width, y: Int(border.width)))
        path.addLine(to: CGPoint(x: 0, y: Int(border.width)))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()

        ctx.setFillColor(border.color.cgColor)
        path.fill()

        // RIGHT
        path.move(to: CGPoint(x: ctx.width, y: 0))
        path.addLine(to: CGPoint(x: ctx.width, y: ctx.height))
        path.addLine(to: CGPoint(x: ctx.width - Int(border.width), y: ctx.height))
        path.addLine(to: CGPoint(x: ctx.width - Int(border.width), y: 0))
        path.addLine(to: CGPoint(x: ctx.width, y: 0))
        path.close()

        ctx.setFillColor(border.color.cgColor)
        path.fill()

        // BOTTOM
        path.move(to: CGPoint(x: ctx.width, y: ctx.height))
        path.addLine(to: CGPoint(x: 0, y: ctx.height))
        path.addLine(to: CGPoint(x: 0, y: ctx.height - Int(border.width)))
        path.addLine(to: CGPoint(x: ctx.width, y: ctx.height - Int(border.width)))
        path.addLine(to: CGPoint(x: ctx.width, y: ctx.height))
        path.close()

        ctx.setFillColor(border.color.cgColor)
        path.fill()


        // LEFT
        path.move(to: CGPoint(x: 0, y: ctx.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: Int(border.width), y: 0))
        path.addLine(to: CGPoint(x: Int(border.width), y: ctx.height))
        path.addLine(to: CGPoint(x: 0, y: ctx.height))
        path.close()

        ctx.setFillColor(border.color.cgColor)
        path.fill()

        UIGraphicsPopContext()
    }
}
