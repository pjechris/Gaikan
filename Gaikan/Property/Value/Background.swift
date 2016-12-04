//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
 Any class/struct conforming to BackgroundValue can be used to represent the `Background` property
*/
public protocol BackgroundValue {
    /// Renders the object into given context
    func draw(in ctx: CGContext)
}

/**
 Allow to use one or more BackgroundValue objects at once as a unique background
 */
public struct Background : BackgroundValue {
    internal var backgrounds: [BackgroundValue]

    public init(_ backgrounds: BackgroundValue...) {
        self.backgrounds = backgrounds
    }

    public func draw(in ctx: CGContext) {
        for bg in self.backgrounds {
            bg.draw(in: ctx)
        }
    }
}
