//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var ComputedStyleAttribute = "ComputedStyleAttribute"

/**
 Applies a `Style` or a `StyleRule` on an object
*/
public protocol Stylable : class {
    /// `Style` class to apply. Calls `computeStyle` when changed
    var styleClass: Style? { get set }
    /// Style specific to the object. Has precedence over `styleClass`.
    /// Works like `style` in HTML.
    var styleInline: StyleRule? { get set }
    /// Custom style state. If defined `computedStyle` will merge state style with "default" state style
    var styleState: String? { get }

    /// Re-applies computed style
    func updateStyle()

    static func keyPathsAffectingStyle() -> [String]
}

extension Stylable {

    /// Result `StyleRule` from `styleClass` (including `styleState`) + `styleInline`.
    /// When changed it calls `updateStyle` to apply it.
    public internal(set) var computedStyle: StyleRule? {
        get {
            let value = objc_getAssociatedObject(self, &ComputedStyleAttribute) as? AssociatedObject<StyleRule>

            return value != nil ? value!.value : nil
        }
        set {
            objc_setAssociatedObject(self, &ComputedStyleAttribute, newValue.map { AssociatedObject($0) }, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.updateStyle()
        }
    }

    /// Calculates style and store it into `computedStyle`
    internal func computeStyle() {
        guard let style = self.styleClass else {
            self.computedStyle = self.styleInline

            return
        }

        let states = StyleState.states(self)
        var computedStyle = style.style

        for state in states {
            computedStyle = style.states[state].map { return $0.extends(computedStyle) } ?? computedStyle
        }

        if let styleInline = self.styleInline {
            self.computedStyle = styleInline.extends(computedStyle)
        }
        else {
            self.computedStyle = computedStyle
        }
    }
}