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
        
        guard border.sides.keys.count != Side.all.count else {
            drawAllSides(for: border, in: ctx)
            return
        }
        drawSingleSides(for: border, in: ctx)
    }

    @inline(__always) func drawAllSides(for border: Border, in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        let topBorder = border.sides[.top]! // Any border here would suffice
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        topBorder.color.setStroke()
        path.lineWidth = CGFloat(topBorder.width)
        path.addClip()
        path.stroke()
        UIGraphicsPopContext()
    }
    
    private func drawSingleSides(for border: Border, in ctx: CGContext) {
        let path = UIBezierPath()

        UIGraphicsPushContext(ctx)

        for (side, border) in border.sides {
            switch(side) {
            case .top:
                self.draw(border: border,
                          path: path,
                          points: [ CGPoint(x: 0, y: 0), CGPoint(x: bounds.width, y: 0), CGPoint(x: bounds.width, y: border.width), CGPoint(x: 0, y: border.width) ])
            case .right:
                self.draw(border: border,
                          path: path,
                          points: [CGPoint(x: bounds.width, y: 0), CGPoint(x: bounds.width, y: bounds.height), CGPoint(x: bounds.width - border.width, y: bounds.height), CGPoint(x: bounds.width - border.width, y: 0)])
            case .bottom:
                self.draw(border: border,
                          path: path,
                          points: [CGPoint(x: bounds.width, y: bounds.height), CGPoint(x: 0, y: bounds.height), CGPoint(x: 0, y: bounds.height - border.width), CGPoint(x: bounds.width, y: bounds.height - border.width)])
            case .left:
                self.draw(border: border,
                          path: path,
                          points: [CGPoint(x: 0, y: bounds.height), CGPoint(x: 0, y: 0), CGPoint(x: Int(border.width), y: 0), CGPoint(x: border.width, y: bounds.height)])
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
