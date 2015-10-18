//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class ViewStyleRenderer {
    public class func render(stylable: UIView, style: Style) {
        self.render(stylable, styleRule: style.normal)
    }

    public class func render(stylable: UIView, styleRule: StyleRule) {
        let border = styleRule.border ?? Border(width: 0, color: nil)
        let visible = styleRule.visible ?? true

        stylable.layer.borderWidth = border.width
        stylable.layer.borderColor = border.color?.CGColor
        stylable.tintColor = styleRule.tintColor
        stylable.hidden = !visible
    }

    public class func render(stylable: UILabel, styleRule: StyleRule) {
        stylable.font = styleRule.font
        stylable.textColor = styleRule.color
    }

    public class func render(button: UIButton, styleRule: StyleRule) {
        self.render(button.titleLabel!, styleRule: styleRule)
    }

    public class func render(textField: UITextField, styleRule: StyleRule) {
        textField.textAlignment = styleRule.textAlign ?? .Natural
    }
}