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
            if (newValue == nil) {
                self.unregisterStyleKeyPaths()
            }

            objc_setAssociatedObject(self, &ViewStyleClassAttr, AssociatedObject(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            self.addStyleLayerIfNeeded()
            self.computeStyle()

            if (newValue != nil) {
                self.registerStyleKeyPaths()
            }
        }
    }

    public var styleInline: StyleRule? {
        get {
            let value = objc_getAssociatedObject(self, &ViewStyleInlineAttr) as? AssociatedObject<StyleRule>

            return value.map { $0.value }
        }
        set {
            objc_setAssociatedObject(self, &ViewStyleInlineAttr, newValue.map { AssociatedObject($0) }, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            self.addStyleLayerIfNeeded()
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
        let keyPaths = type(of: self).keyPathsAffectingStyle()

        if keyPaths.count > 0 {
            self.kvoController.observe(self, keyPaths: keyPaths, options: .new) { [weak self] _ in
                self?.computeStyle()
            }
        }
    }

    func unregisterStyleKeyPaths() {
        type(of: self).keyPathsAffectingStyle().map { self.kvoController.unobserve(self, keyPath: $0) }
    }
}

var StyleKeyAttribute = "StyleLayer"
extension UIView {

    var styleLayer: StyleLayer! {
        get { return objc_getAssociatedObject(self, &StyleKeyAttribute) as? StyleLayer }
        set { objc_setAssociatedObject(self, &StyleKeyAttribute, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    func addStyleLayerIfNeeded() {
        if let _ = self.styleLayer {
            return
        }

        let styleLayer = StyleLayer()

        self.styleLayer = styleLayer
        self.layer.insertSublayer(styleLayer, at: 0)

        styleLayer.frame = self.layer.bounds
        self.registerBounds()
    }

    func registerBounds() {
        self.kvoController.observe(self.layer, keyPath: "bounds", options: .new) { [weak self] _ in
            guard let weakSelf = self else {
                return
            }

            weakSelf.styleLayer?.frame = weakSelf.layer.bounds
        }
    }
}
