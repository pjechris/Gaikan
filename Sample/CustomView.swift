//
// This file is part of Gaikan
//
// Created by JC on 16/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Gaikan

class CustomView : UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var footnote: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var button: UIButton!

    @IBAction func gotIt() {
        self.button.setTitle("Great!", for: .normal)
        self.button.styleClass = SampleTheme().gotIt
    }
}
