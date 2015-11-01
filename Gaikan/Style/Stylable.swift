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

public protocol Stylable: class {
    var styleName: String? { get set }
    var computedStyle: StyleRule? { get }

    func updateStyle()
    func computeStyle()
    func applyStyle(style: StyleRule)

    static func keyPathsAffectingStyle() -> [String]
}

extension Stylable {
    var stylesRef: [String:Style]? {
        get {
            let value = objc_getAssociatedObject(self, &StylableStylesRefAttribute) as? AssociatedObject<[String:Style]?>

            return value != nil ? value!.value : nil
        }
        set {
            objc_setAssociatedObject(self, &StylableStylesRefAttribute, AssociatedObject(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.computeStyle()
        }
    }

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