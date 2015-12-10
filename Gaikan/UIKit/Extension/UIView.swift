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
        guard let computedStyle = self.computedStyle else {
            return
        }

        ViewStyleRenderer.render(self, styleRule: computedStyle)
    }

    public func computeStyle() {
        guard let styleName = self.styleName, let style = self.stylesRef?[styleName] else {
            return
        }

        let states = StyleState.states(fromView: self)
        var computedStyle = style.style

        for state in states {
            computedStyle = style.states[state].map { return $0.extends(computedStyle) } ?? computedStyle
        }

        self.computedStyle = computedStyle
    }

    public func applyStyle(style: StyleRule) {
        self.computedStyle = style
    }

    public class func keyPathsAffectingStyle() -> [String] {
        return []
    }
}

internal extension UIView {
    func registerStyleKeyPaths() {
        let keyPaths = self.dynamicType.keyPathsAffectingStyle()

        if keyPaths.count > 0 {
            self.KVOController.observe(self, keyPaths: keyPaths, options: .New) { [weak self] _ in
                self?.computeStyle()
            }
        }

        self.KVOController.observe(self.layer, keyPath: "bounds", options: .New) { [weak self] _ in
            self?.updateStyle()
        }
    }

    func unregisterStyleKeyPaths() {
        self.KVOController.unobserveAll()
    }
}
