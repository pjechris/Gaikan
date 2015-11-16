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
        super.viewDidLoad()

        self.customView = self.view as! CustomView
        self.customView.styleTheme = RailTheme()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

