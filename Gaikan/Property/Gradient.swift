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

    fileprivate init(from: CGPoint, to: CGPoint, _ gradients: [(color: UIColor, position: Int)]) {
        self.from = from
        self.to = to
        self.gradientValues = gradients
    }
}

extension Gradient : BackgroundValue {
    public func draw(in ctx: CGContext) {
        let layer = CAGradientLayer()

        layer.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: ctx.width, height: ctx.height))

        layer.endPoint = self.to
        layer.startPoint = self.from
        layer.colors = self.gradientValues.map { $0.color.cgColor }
        layer.locations = self.gradientValues.map { NSNumber(value:($0.position/100)) }

        layer.render(in: ctx)
    }
}
