//
// This file is part of Gaikan
//
// Created by JC on 09/05/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

extension UIFont {
    class func bodyFont() -> UIFont? {
        return UIFont(name: "Avenir", size: 12)
    }

    class func titleFont() -> UIFont? {
        return UIFont(name: "AvenirNext-Bold", size: 38)
    }

    class func footnoteFont() -> UIFont? {
        return UIFont(name: "AvenirNext-Italic", size: 18)
    }
}