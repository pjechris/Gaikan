//
// This file is part of Gaikan
//
// Created by JC on 09/05/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Gaikan

class SampleTheme : Theme {
    var home =  Style() { (inout style: StyleRule) -> () in
        style.background = Background(UIImage(named: "background")!, Gradient.orangeGradient())
    }

    var logo = Style() { (inout style: StyleRule) -> () in
        style.tintColor = UIColor.logoColor()
    }

    var title: Style = [
        .Color: UIColor.whiteColor(),
        .Font: UIFont.titleFont()
    ]

    var footnote =  Style() { (inout style: StyleRule) -> () in
        style.font = UIFont.footnoteFont()
        style.color = UIColor.orangeRail()
    }

    var getIt: Style = [
        .Border: Border(width: 1, color: UIColor.whiteColor()),
        .Color: UIColor.whiteColor()
    ]

    var gotIt: Style = [
        .Color: UIColor.orangeRail()
    ]
}