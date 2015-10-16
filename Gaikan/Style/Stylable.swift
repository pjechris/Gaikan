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

    func applyStyle(style: StyleRule)
    func applyStyle(style: Style)
}

extension Stylable {
    var stylesRef: [String:Style]? {
        get { return objc_getAssociatedObject(self as! AnyObject, &StylableStylesRefAttribute) as? [String:Style] }
        set {
            objc_setAssociatedObject(self as! AnyObject, &StylableStylesRefAttribute, newValue as! AnyObject, .OBJC_ASSOCIATION_ASSIGN)
            self.updateStyle()
        }
    }

    func updateStyle() {
        if let styleName = self.styleName, let style = self.stylesRef?[styleName] {
            self.applyStyle(style)
        }
    }
}