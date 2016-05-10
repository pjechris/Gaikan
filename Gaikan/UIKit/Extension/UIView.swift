//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import KVOController

var ViewStyleStateAttribute = "ViewStyleStateAttribute"
var ViewStyleClassAttr = "ViewStyleClassAttr"
var ViewStyleInlineAttr = "ViewStyleInlineAttr"

extension UIView : Stylable {
    public var styleClass: Style? {
        get {
            let value = objc_getAssociatedObject(self, &ViewStyleClassAttr) as? AssociatedObject<Style?>

            return value.map { $0.value } ?? nil
        }
        set {
            if (self.styleClass == nil) {
                self.registerStyleKeyPaths()
            }

            if (newValue == nil) {
                self.unregisterStyleKeyPaths()
            }

            objc_setAssociatedObject(self, &ViewStyleClassAttr, AssociatedObject(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.computeStyle()
        }
    }

    public var styleInline: StyleRule? {
        get {
            let value = objc_getAssociatedObject(self, &ViewStyleInlineAttr) as? AssociatedObject<StyleRule>

            return value.map { $0.value }
        }
        set {
            objc_setAssociatedObject(self, &ViewStyleInlineAttr, newValue.map { AssociatedObject($0) }, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.computeStyle()
        }
    }

    public var styleState: String? {
        get { return objc_getAssociatedObject(self, &ViewStyleStateAttribute) as? String }
        set {
            objc_setAssociatedObject(self, &ViewStyleStateAttribute, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.computeStyle()
        }
    }

    public func updateStyle() {
        guard let computedStyle = self.computedStyle else {
            return
        }

        ViewStyleRenderer.render(self, styleRule: computedStyle)
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
