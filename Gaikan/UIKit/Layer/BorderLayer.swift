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

        for (side, border) in border.sides {
            switch(side) {
            case .top:
                self.draw(border: border,
                          path: path,
                          points: [ CGPoint(x: 0, y: 0), CGPoint(x: ctx.width, y: 0), CGPoint(x: ctx.width, y: Int(border.width)), CGPoint(x: 0, y: Int(border.width)) ])
            case .right:
                self.draw(border: border,
                          path: path,
                          points: [CGPoint(x: ctx.width, y: 0), CGPoint(x: ctx.width, y: ctx.height), CGPoint(x: ctx.width - Int(border.width), y: ctx.height), CGPoint(x: ctx.width - Int(border.width), y: 0)])
            case .bottom:
                self.draw(border: border,
                          path: path,
                          points: [CGPoint(x: ctx.width, y: ctx.height), CGPoint(x: 0, y: ctx.height), CGPoint(x: 0, y: ctx.height - Int(border.width)), CGPoint(x: ctx.width, y: ctx.height - Int(border.width))])
            case .left:
                self.draw(border: border,
                          path: path,
                          points: [CGPoint(x: 0, y: ctx.height), CGPoint(x: 0, y: 0), CGPoint(x: Int(border.width), y: 0), CGPoint(x: Int(border.width), y: ctx.height)])
            }
        }

        UIGraphicsPopContext()
    }

    func draw(border: BorderStyle, path: UIBezierPath, points: [CGPoint]) {
        guard let first = points.first else {
            return
        }

        path.move(to: first)
        for point in points {
            path.addLine(to: point)
        }
        path.close()

        border.color.setFill()
        path.fill()
    }
}
