//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension UIColor : BackgroundValue {
    public func render(intoView view: UIView) {
        BackgroundRenderer.render(self, intoView: view)
    }
}