//
// This file is part of Gaikan
//
// Created by JC on 03/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import UIKit
import Gaikan

class ViewController: UIViewController {
    var customView: CustomView!

    override func viewDidLoad() {
        let titleStyle: StyleRule = [
            .Font: UIFont(name: "AvenirNext-Italic", size: 16),
            .Color: UIColor.purpleColor()
        ]
        
        super.viewDidLoad()

        self.customView = self.view as! CustomView

        self.navigationController?.navigationBar.titleStyle.styleInline = titleStyle
    }
}

