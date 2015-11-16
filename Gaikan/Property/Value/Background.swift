//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol BackgroundValue {
    func render(inContext ctx: CGContextRef)
}

public struct Background : BackgroundValue {
    internal var backgrounds: [BackgroundValue]

    public init(_ backgrounds: BackgroundValue...) {
        self.backgrounds = backgrounds
    }

    public func render(inContext ctx: CGContextRef) {
        BackgroundRenderer.render(self, inContext: ctx)
    }
}