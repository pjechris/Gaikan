//
// This file is part of Gaikan
//
// Created by JC on 18/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
 Dynamic dispatcher renderer to workaround Swift static dispatcher
**/
internal class ViewDynamicRenderer {
    final class func render(view: UIView, styleRule: StyleRule) {
        ViewStyleRenderer.render(view, styleRule: styleRule)

        if let label = view as? UILabel {
            return ViewStyleRenderer.render(label, styleRule: styleRule)
        }

        if let control = view as? UIControl {
            if let button = control as? UIButton {
                return ViewStyleRenderer.render(button, styleRule: styleRule)
            }

            if let textField = control as? UITextField {
                return ViewStyleRenderer.render(textField, styleRule: styleRule)
            }
        }
    }
}
