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
    final class func render(_ background: Background, intoView view: UIView) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let ctx = CGContext(data: nil, width: Int(view.bounds.size.width), height: Int(view.bounds.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 6)

        guard let context = ctx else {
            return
        }

        for bg in background.backgrounds {
            bg.render(inContext: context)
        }

        view.backgroundColor = UIColor(patternImage: UIImage(cgImage: context.makeImage()!))
    }

    final class func render(_ color: UIColor, inContext ctx:CGContext) {
        ctx.setFillColor(color.cgColor)
        ctx.fill(CGRect(origin: CGPoint.zero, size: CGSize(width: ctx.width, height: ctx.height)))
    }

    class func render(_ gradient: Gradient, inContext ctx: CGContext) {
        let layer = CAGradientLayer()

        layer.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: ctx.width, height: ctx.height))

        layer.endPoint = gradient.to
        layer.startPoint = gradient.from
        layer.colors = gradient.gradientValues.map { gradient in return gradient.color.cgColor }
        layer.locations = gradient.gradientValues.map { gradient in return NSNumber(value:(gradient.position/100))
        }

        layer.render(in: ctx)
    }

    final class func render(_ image: UIImage, inContext ctx: CGContext) {
        ctx.draw(image.cgImage!, in: CGRect(origin: CGPoint.zero, size: image.size))
    }

    final class func render(_ background: Background, inContext ctx: CGContext) {
        for bg in background.backgrounds {
            bg.render(inContext: ctx)
        }
    }
}
