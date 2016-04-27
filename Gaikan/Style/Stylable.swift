//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var StylableStylesRefAttribute = "StylableStylesRefAttribute"
var ComputedStyleAttribute = "ComputedStyleAttribute"

/**
 Define methods allow an object to apply a StyleRule to style itself
*/
public protocol Stylable : class {
    var styleClass: Style? { get set }

    var styleState: String? { get }
    var computedStyle: StyleRule? { get }

    func updateStyle()
    func computeStyle()
    func applyStyle(style: StyleRule)

    static func keyPathsAffectingStyle() -> [String]
}

extension Stylable {

    public var computedStyle: StyleRule? {
        get {
            let value = objc_getAssociatedObject(self, &ComputedStyleAttribute) as? AssociatedObject<StyleRule?>

            return value != nil ? value!.value : nil
        }
        set {
            objc_setAssociatedObject(self, &ComputedStyleAttribute, AssociatedObject(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.updateStyle()
        }
    }
}