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
        set { objc_setAssociatedObject(self, &ViewStyleNameAttribute, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    public func applyStyle(style: StyleRule) {
        ViewStyleRenderer.render(self, styleRule: style)
    }

    public func applyStyle(stylesheet: Stylesheet) {
        if let style = stylesheet[self.styleName] {
            self.applyStyle(style)
        }
    }
}