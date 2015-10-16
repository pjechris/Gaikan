//
// This file is part of Gaikan
//
// Created by JC on 03/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension Stylable where Self : UIControl {
    func applyStyle(style: Style) {
        let pseudoClasses = self.controlPseudoClasses()
        var styleRule = style.normal

        for pseudoClass in pseudoClasses {
            styleRule = style[pseudoClass].map { return $0.extends(styleRule) } ?? styleRule
        }

        self.applyStyle(styleRule)
    }
}

extension UIControl {
    func controlPseudoClasses() -> [StylePseudoClass] {
        var pseudoClasses: [StylePseudoClass] = []

        if (self.highlighted) {
            pseudoClasses.append(.Highlighted)
        }

        if (!self.enabled) {
            pseudoClasses.append(.Disabled)
        }

        if (self.selected) {
            pseudoClasses.append(.Selected)
        }

        return pseudoClasses
    }
}