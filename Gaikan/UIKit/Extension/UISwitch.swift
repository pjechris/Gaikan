//
// This file is part of Gaikan
//
// Created by JC on 24/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public extension UIButton {
    public override func updateStyle() {
        super.updateStyle()

        guard let computedStyle = self.computedStyle else {
            return
        }

        ViewStyleRenderer.render(self, styleRule: computedStyle)
    }
}