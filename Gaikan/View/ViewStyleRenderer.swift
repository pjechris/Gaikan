//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class ViewStyleRenderer {
    public class func render(stylable: UIView, styleRule: StyleRule) {
        stylable.tintColor = styleRule.tintColor
        stylable.hidden = !styleRule.visible

        self.forward(stylable, styleRule: styleRule)
    }
}

internal extension ViewStyleRenderer {
    /// Sadly overloading method with UIView as param does not work so we use this method as a workaround
    internal class func forward(stylable: UIView, styleRule: StyleRule) {
        if let label = stylable as? UILabel {
            self.render(label, styleRule: styleRule)
        }
    }
}