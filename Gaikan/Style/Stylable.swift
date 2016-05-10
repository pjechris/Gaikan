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
 Define methods allow an object to apply a StyleRule to style itself
*/
public protocol Stylable : class {
    var styleClass: Style? { get set }
    var styleInline: StyleRule? { get set }
    var styleState: String? { get }

    func updateStyle()

    static func keyPathsAffectingStyle() -> [String]
}

extension Stylable {

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

    public func computeStyle() {
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