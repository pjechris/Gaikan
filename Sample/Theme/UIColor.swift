//
// This file is part of Gaikan
//
// Created by JC on 09/05/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

extension UIColor {
    static func orangeRail() -> UIColor {
        return UIColor(red: 251/255, green: 208/255, blue: 176/255, alpha: 1)
    }

    class func logoColor() -> UIColor {
        return UIColor(red: 244/255, green: 176/255, blue: 125/255, alpha: 1)
            .colorWithAlphaComponent(0.7)
    }
}