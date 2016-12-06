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
    var home =  Style() { (style: inout StyleRule) -> () in
        style.background = Background(UIImage(named: "background")!, Gradient.orangeGradient())
    }

    var logo = Style() { (style: inout StyleRule) -> () in
        style.tintColor = UIColor.logoColor()
        style.width = 90
        style.height = style.width
    }

    var title: Style = [
        .color: UIColor.white,
        .font: UIFont.titleFont()
    ]

    var footnote =  Style() { (style: inout StyleRule) -> () in
        style.font = UIFont.footnoteFont()
        style.color = UIColor.orangeRail()
    }

    var getIt: Style = [
        .border: Border(all: (width: 1, color: UIColor.white)),
        .color: UIColor.white
    ]

    var gotIt: Style = [
        .color: UIColor.orange
    ]
}
