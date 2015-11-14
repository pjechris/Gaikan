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
    final class func render(gradient: Gradient, intoView view: UIView) {
        let layer = CAGradientLayer()
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let bitmapContext = CGBitmapContextCreate(nil, Int(view.bounds.size.width), Int(view.bounds.size.height), 8, 0, colorSpace, 6)

        layer.frame = view.bounds

        layer.endPoint = gradient.to
        layer.startPoint = gradient.from
        layer.colors = gradient.gradientValues.map { gradient in return gradient.color.CGColor }
        layer.locations = gradient.gradientValues.map { gradient in return gradient.position / 100 }

        layer.renderInContext(bitmapContext!)
        view.backgroundColor = UIColor.init(patternImage: UIImage.init(CGImage: CGBitmapContextCreateImage(bitmapContext)!))
    }

    final class func render(color: UIColor, intoView view: UIView) {
        view.backgroundColor = color
    }
}