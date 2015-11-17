//
// This file is part of Gaikan
//
// Created by JC on 16/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Gaikan

@IBDesignable class CustomView : UIView, Themable {
    typealias ThemeType = RailTheme

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var footnote: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var button: UIButton!

    func stylableThemeItems() -> [Stylable] {
        return [self, self.title, self.footnote, self.logo, self.button]
    }

    @IBAction func gotIt() {
        self.button.setTitle("Great!", forState: .Normal)
        self.button.styleName = "got-it"
    }
}
