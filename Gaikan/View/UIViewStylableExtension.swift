//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import KVOController

var ViewStyleNameAttribute = "ViewStyleNameAttribute"

extension UIView : Stylable {
    @IBInspectable public var styleName: String? {
        get { return objc_getAssociatedObject(self, &ViewStyleNameAttribute) as? String }
        set {
            if (self.styleName == nil) {
                self.registerStyleKeyPaths()
            }

            if (newValue == nil) {
                self.unregisterStyleKeyPaths()
            }

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

    func registerStyleKeyPaths() {
        let keyPaths = self.dynamicType.keyPathsAffectingStyle()

        if keyPaths.count > 0 {
            self.KVOController.observe(self, keyPaths: keyPaths, options: .New) { [weak self] _ in
                self?.updateStyle()
            }
        }
    }

    func unregisterStyleKeyPaths() {
        self.KVOController.unobserveAll()
    }

    public class func keyPathsAffectingStyle() -> [String] {
        return []
    }

    public func updateStyle() {
        if let styleName = self.styleName, let style = self.stylesRef?[styleName] {
            self.applyStyle(style)
        }
    }
}

