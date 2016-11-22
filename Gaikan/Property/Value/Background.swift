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
    /// Render the object into given context
    func render(inContext ctx: CGContext)
}

/**
 Allow to use one or more BackgroundValue objects at once as a unique background
 */
public struct Background : BackgroundValue {
    internal var backgrounds: [BackgroundValue]

    public init(_ backgrounds: BackgroundValue...) {
        self.backgrounds = backgrounds
    }

    public func render(inContext ctx: CGContext) {
        BackgroundRenderer.render(self, inContext: ctx)
    }
}
