//
// This file is part of Gaikan
//
// Created by JC on 16/11/15.
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

extension UIColor {
    class func logoColor() -> UIColor {
        return UIColor(red: 231/255, green: 83/255, blue: 72/255, alpha: 1)
    }
}

public class RailTheme : Theme {
    public func styles() -> [String : Style] {
        return [
            "home": Style() { (inout style: StyleRule) -> () in
                style.background = Background(UIImage(named: "background")!, Gradient.orangeGradient())
            },

            "logo": Style() { (inout style: StyleRule) -> () in
                style.tintColor = UIColor.whiteColor()
            }
                .include(.Selected, attributes: [
                    .TintColor: UIColor.logoColor().colorWithAlphaComponent(0.6)
                ]),

            "title": [
                .Color: UIColor.whiteColor(),
                .Font: UIFont(name: "AvenirNext-Bold", size: 38)
            ],

            "footnote": Style()
                { (inout style: StyleRule) -> () in
                    style.font = UIFont(name: "AvenirNext-Italic", size: 18)
                    style.color = UIColor(red: 251/255, green: 208/255, blue: 176/255, alpha: 1)
            }
        ]
    }
}