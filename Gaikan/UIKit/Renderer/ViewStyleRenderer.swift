//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

internal class ViewStyleRenderer {
    final class func render(_ stylable: UIView, styleRule: StyleRule) {
        let visible = styleRule.visible ?? true
        let corners = styleRule.corners ?? Corners(radius: 0)
        
        stylable.layer.cornerRadius = corners.radius
        stylable.clipsToBounds = styleRule.clip
        stylable.layer.masksToBounds = styleRule.clip

        stylable.layer.transform = styleRule.transform
        stylable.tintColor = styleRule.tintColor
        stylable.isHidden = !visible
        stylable.alpha = CGFloat(styleRule.opacity / 100)
        stylable.layoutMargins = styleRule.margin ?? stylable.layoutMargins

        if let shadow = styleRule.shadow {
            stylable.layer.shadowOpacity = 1
            stylable.layer.shadowOffset = shadow.shadowOffset
            stylable.layer.shadowRadius = shadow.shadowBlurRadius
            stylable.layer.shadowColor = (shadow.shadowColor as? UIColor)?.cgColor
        }
        else {
            stylable.layer.shadowOpacity = 0
        }

        stylable.styleLayer.styleClass = styleRule
        stylable.styleLayer.cornerRadius = corners.radius

        ConstraintRenderer.render(stylable, styleRule: styleRule)
    }

    final class func render(_ stylable: UILabel, styleRule: StyleRule) {
        stylable.font = styleRule.font
        stylable.textColor = styleRule.color
        stylable.lineBreakMode = styleRule.textOverflow ?? .byTruncatingTail
    }

    final class func render(_ button: UIButton, styleRule: StyleRule) {
        if let titleLabel = button.titleLabel {
            self.render(titleLabel, styleRule: styleRule)
        }

        button.setTitleColor(styleRule.color, for: UIControlState())
        button.contentEdgeInsets = styleRule.margin ?? button.contentEdgeInsets
    }

    final class func render(_ textField: UITextField, styleRule: StyleRule) {
        textField.textAlignment = styleRule.textAlign ?? .natural
    }
    
    final class func render(_ navigationBar: UINavigationBar, titleStyle: StyleRule) {
        navigationBar.titleTextAttributes = titleStyle.textAttributes
    }
}
