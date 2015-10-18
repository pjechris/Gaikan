//
// This file is part of Gaikan
//
// Created by JC on 03/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension Stylable where Self : UIControl {
    public func applyStyle(style: StyleRule) {
        ViewStyleRenderer.render(self as UIView, styleRule: style)
        ViewStyleRenderer.render(self, styleRule: style)
    }
}