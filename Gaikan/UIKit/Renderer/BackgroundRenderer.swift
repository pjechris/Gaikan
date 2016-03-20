//
// This file is part of Gaikan
//
// Created by JC on 07/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

internal class BackgroundRenderer {
    final class func render(background: Background, intoView view: UIView) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGBitmapContextCreate(nil, Int(view.bounds.size.width), Int(view.bounds.size.height), 8, 0, colorSpace, 6)!

        for bg in background.backgrounds {
            bg.render(inContext: context)
        }

        view.backgroundColor = UIColor(patternImage: UIImage(CGImage: CGBitmapContextCreateImage(context)!))
    }

    final class func render(color: UIColor, inContext ctx:CGContextRef) {
        CGContextSetFillColorWithColor(ctx, color.CGColor)
        CGContextFillRect(ctx, CGRect(origin: CGPointZero, size: CGSize(width: CGBitmapContextGetWidth(ctx), height: CGBitmapContextGetHeight(ctx))))
    }

    class func render(gradient: Gradient, inContext ctx: CGContextRef) {
        let layer = CAGradientLayer()

        layer.frame = CGRect(origin: CGPointZero, size: CGSize(width: CGBitmapContextGetWidth(ctx), height: CGBitmapContextGetHeight(ctx)))

        layer.endPoint = gradient.to
        layer.startPoint = gradient.from
        layer.colors = gradient.gradientValues.map { gradient in return gradient.color.CGColor }
        layer.locations = gradient.gradientValues.map { gradient in return Float(gradient.position) / Float(100) }

        layer.renderInContext(ctx)
    }

    final class func render(image: UIImage, inContext ctx: CGContext) {
        CGContextDrawImage(ctx, CGRect(origin: CGPointZero, size: image.size), image.CGImage)
    }

    final class func render(background: Background, inContext ctx: CGContextRef) {
        for bg in background.backgrounds {
            bg.render(inContext: ctx)
        }
    }
}