//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct Gradient  {
    public typealias GradientItem = (color: UIColor, position: Int)

    let gradientValues: [(color: UIColor, position: Int)]
    let to: CGPoint
    let from: CGPoint

    public init(from: CGPoint, to: CGPoint, _ gradients: (color: UIColor, position: Int)...) {
        self.init(from: from, to: to, gradients)
    }

    public init(_ gradients: (color: UIColor, position: Int)...) {
        self.init(from: CGPoint.top(), to: CGPoint.bottom(), gradients)
    }

    private init(from: CGPoint, to: CGPoint, _ gradients: [(color: UIColor, position: Int)]) {
        self.from = from
        self.to = to
        self.gradientValues = gradients
    }
}

extension Gradient : BackgroundValue {
    public func render(inContext ctx: CGContextRef) {
        BackgroundRenderer.render(self, inContext: ctx)
    }
}