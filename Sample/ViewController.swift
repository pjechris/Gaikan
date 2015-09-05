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
    @IBOutlet weak var label : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let style: StyleRule = [
            .Color: UIColor.redColor(),
            .Border: Border(width: 1, color: UIColor.greenColor()),
            .Font: UIFont(name: "Courier", size: 26),
            .TintColor: UIColor.blueColor() ]

        self.label.applyStyle(style)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

