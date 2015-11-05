//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct Gradient : BackgroundColor {
    public typealias GradientItem = (color: UIColor, position: Int?)

    let to: CGPoint
    let gradients: [GradientItem]

    public init(to: CGPoint, _ gradients: GradientItem...) {
        self.init(to: to, gradients)
    }

    public init(_ gradients: GradientItem...) {
        self.init(gradients)
    }

    private init(to: CGPoint = CGPoint.bottom(), _ gradients: [GradientItem]) {
        self.to = to
        self.gradients = gradients
    }
}