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
            self.computeStyle()
        }
    }

    public func updateStyle() {
        ViewStyleRenderer.render(self, styleRule: self.computedStyle!)
    }

    public func applyStyle(style: StyleRule) {
        self.computedStyle = style
    }

    func registerStyleKeyPaths() {
        let keyPaths = self.dynamicType.keyPathsAffectingStyle()

        if keyPaths.count > 0 {
            self.KVOController.observe(self, keyPaths: keyPaths, options: .New) { [weak self] _ in
                self?.computeStyle()
            }
        }
    }

    func unregisterStyleKeyPaths() {
        self.KVOController.unobserveAll()
    }

    public class func keyPathsAffectingStyle() -> [String] {
        return []
    }

    func computeStyle() {
        guard let styleName = self.styleName, let style = self.stylesRef?[styleName] else {
            return
        }

        let pseudoClasses = StylePseudoClass.fromView(self)
        var computedStyle = StyleRule()

        for pseudoClass in pseudoClasses {
            computedStyle = style[pseudoClass].map { return $0.extends(computedStyle) } ?? computedStyle
        }

        self.computedStyle = computedStyle
    }
}
