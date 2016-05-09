//
// This file is part of Gaikan
//
// Created by JC on 09/05/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Gaikan

extension Gradient {
    static func orangeGradient() -> Gradient {
        return Gradient(
            (color: UIColor(red: 251/255, green: 208/255, blue: 176/255, alpha: 0.5), position: 0),
            (color: UIColor(red: 137/255, green: 106/255, blue: 111/255, alpha: 0.5), position: 100)
        )
    }
}