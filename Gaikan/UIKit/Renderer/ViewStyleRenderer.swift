//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

internal class ViewStyleRenderer {
    final class func render(stylable: UIView, styleRule: StyleRule) {
        let border = styleRule.border ?? Border(width: 0, color: nil)
        let visible = styleRule.visible ?? true

        stylable.layer.borderWidth = border.width
        stylable.layer.borderColor = border.color?.CGColor
        stylable.tintColor = styleRule.tintColor
        stylable.hidden = !visible

        if let background = styleRule.background {
            BackgroundRenderer.render(Background(background), intoView: stylable)
        }
    }

    final class func render(stylable: UILabel, styleRule: StyleRule) {
        stylable.font = styleRule.font
        stylable.textColor = styleRule.color
    }

    final class func render(button: UIButton, styleRule: StyleRule) {
        self.render(button.titleLabel!, styleRule: styleRule)

        button.setTitleColor(styleRule.color, forState: .Normal)
    }

    final class func render(textField: UITextField, styleRule: StyleRule) {
        textField.textAlignment = styleRule.textAlign ?? .Natural
    }
    
    final class func render(navigationBar: UINavigationBar, styleRule: StyleRule) {
        var attributes = [String: AnyObject]()
        
        if let titleForegroundColorAttribute = styleRule.titleForegroundColor {
            attributes[NSForegroundColorAttributeName] = titleForegroundColorAttribute
        }
        
        if let fontAttribute = styleRule.titleFont {
            attributes[NSFontAttributeName] = fontAttribute
        }
        
        if let shadowAttribute = styleRule.titleShadow {
            attributes[NSShadowAttributeName] = shadowAttribute
        }
        
        navigationBar.titleTextAttributes = attributes
    }
}