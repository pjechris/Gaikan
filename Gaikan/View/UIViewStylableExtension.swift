//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var ViewStyleNameAttribute = "ViewStyleNameAttribute"

extension UIView : Stylable {
    @IBInspectable public var styleName: String? {
        get { return objc_getAssociatedObject(self, &ViewStyleNameAttribute) as? String }
        set {
            objc_setAssociatedObject(self, &ViewStyleNameAttribute, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.updateStyle()
        }
    }

    public func applyStyle(style: StyleRule) {
        ViewDynamicRenderer.render(self, styleRule: style)
    }

    public func applyStyle(style: Style) {
        let pseudoClasses = StylePseudoClass.fromView(self)
        var styleRule = StyleRule()

        for pseudoClass in pseudoClasses {
            styleRule = style[pseudoClass].map { return $0.extends(styleRule) } ?? styleRule
        }

        self.applyStyle(styleRule)
    }
}