//
// This file is part of Gaikan
//
// Created by JC on 14/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var ThemableStyleThemeAttribute = "ThemableStyleThemeAttribute"

/**
 Recursive styling using a dedicated `styleTheme` object containing the style definitions
*/
public protocol Themable : Stylable {
    typealias ThemeType: Theme

    var styleTheme: ThemeType? { get set }

    func stylableThemeItems() -> [Stylable]
}

extension Themable {
    public var styleTheme: ThemeType? {
        get {
            let value = objc_getAssociatedObject(self, &ThemableStyleThemeAttribute) as? AssociatedObject<ThemeType?>

            return value != nil ? value!.value : nil
        }
        set {
            objc_setAssociatedObject(self, &ThemableStyleThemeAttribute, AssociatedObject(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
