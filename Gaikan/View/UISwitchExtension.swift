//
// This file is part of Gaikan
//
// Created by JC on 16/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension Stylable where Self : UISwitch {
    func applyStyle(style: Style) {
        let pseudoClasses = self.switchPseudoClasses()
        var styleRule = style.normal

        for pseudoClass in pseudoClasses {
            styleRule = style[pseudoClass].map { return $0.extends(styleRule) } ?? styleRule
        }

        self.applyStyle(styleRule)
    }
}

extension UISwitch {
    func switchPseudoClasses() -> [StylePseudoClass] {
        var pseudoClasses = self.controlPseudoClasses()

        if (self.on) {
            pseudoClasses.append(.On)
        }

        return pseudoClasses
    }
}