//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol Stylable {
    var styleName: String? { get set }

    func applyStyle(style: StyleRule)
    func applyStyle(stylesheet: Stylesheet)
}