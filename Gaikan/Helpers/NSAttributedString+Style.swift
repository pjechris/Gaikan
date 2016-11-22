//
// This file is part of Gaikan
//
// Created by JC on 20/06/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension NSAttributedString {
    public convenience init(string str: String, style: StyleRule) {
        self.init(string: str, attributes: style.textAttributes)
    }
}

extension NSMutableAttributedString {
    public func setStyle(_ style: StyleRule, range: NSRange) {
        self.setAttributes(style.textAttributes, range: range)
    }
}
