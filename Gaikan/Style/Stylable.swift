//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var StylableStylesRefAttribute = "StylableStylesRefAttribute"

public protocol Stylable {
    var styleName: String? { get set }

    func updateStyle()
    func applyStyle(style: StyleRule)
    func applyStyle(style: Style)

    static func keyPathsAffectingStyle() -> [String]
}


extension Stylable {
    var stylesRef: [String:Style]? {
        get {
            let value = objc_getAssociatedObject(self as! AnyObject, &StylableStylesRefAttribute) as? AssociatedObject<[String:Style]?>

            return value != nil ? value!.value : nil
        }
        set {
            objc_setAssociatedObject(self as! AnyObject, &StylableStylesRefAttribute, AssociatedObject(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.updateStyle()
        }
    }
}