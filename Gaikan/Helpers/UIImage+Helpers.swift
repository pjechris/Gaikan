//
// This file is part of Gaikan
//
// Created by JC on 15/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension UIImage : BackgroundValue {
    public func draw(in ctx: CGContext) {
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: ctx.width, height: ctx.height)))
    }
}
