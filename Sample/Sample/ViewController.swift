//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import UIKit
import Gaikan

class ViewController: UIViewController {
    @IBOutlet weak var label : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let style : StyleRule = [ .Color: UIColor.redColor(), .TintColor: UIColor.blueColor() ]

        self.label.applyStyle(style)
        print("TextColor \(style.color) VS \(self.label.textColor)")
        print("TintColor \(style.tintColor) VS \(self.label.tintColor)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

