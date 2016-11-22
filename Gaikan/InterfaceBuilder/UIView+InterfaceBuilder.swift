//
// This file is part of Gaikan
//
// Created by JC on 03/05/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var ViewStyleNameAttribute = "ViewStyleNameAttribute"
var ViewThemeClassAttr = "ViewThemeClassAttr"

/**
 *  Dynamically retrieves a "defined styleClass" from a storyboard/xib.
 */
extension UIView {
    /// theme class which contains desired styleClass instance.
    /// You need to provide both `styleName` and `themeClassName` so that style can be dynamically found
    @IBInspectable var themeClassName: String? {
        get { return objc_getAssociatedObject(self, &ViewThemeClassAttr) as? String }
        set {
            guard let newValue = newValue else {
                return
            }

            let moduleName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let className = newValue.contains(".") ? newValue : moduleName + "." + newValue

            objc_setAssociatedObject(self, &ViewThemeClassAttr, className, .OBJC_ASSOCIATION_COPY)
            self.attemptLoadingStyle()
        }
    }

    /// styleClass attribute name into its theme class.
    /// You need to provide both `styleName` and `themeClassName` so that style can be dynamically found
    @IBInspectable var styleName: String? {
        get { return objc_getAssociatedObject(self, &ViewStyleNameAttribute) as? String }
        set {
            objc_setAssociatedObject(self, &ViewStyleNameAttribute, newValue, .OBJC_ASSOCIATION_COPY)
            self.attemptLoadingStyle()
        }
    }

    fileprivate func attemptLoadingStyle() {
        guard let styleName = self.styleName, let themeClassName = self.themeClassName else {
            return
        }

        let themeClass = NSClassFromString(themeClassName) as! Theme.Type
        let dynamicTheme = themeClass.init()
        let dynamicMirror = Mirror(reflecting: dynamicTheme)

        for (label, value) in dynamicMirror.children {
            if label == styleName {
                self.styleClass = value as? Style
            }
        }
    }
}
