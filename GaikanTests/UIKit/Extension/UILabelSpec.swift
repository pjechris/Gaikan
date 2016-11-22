//
// This file is part of Gaikan
//
// Created by JC on 11/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Quick
import Nimble
import Gaikan

class UILabelSpec: QuickSpec {
    override func spec() {
        var label: UILabel!

        beforeEach {
            label = UILabel()
        }

        describe("styleInline") {
            var style: StyleRule!

            context("when giving style") {
                it("should inherit view styles") {
                    style = [ .tintColor: UIColor.blue ]

                    label.styleInline = style

                    expect(label.tintColor) == UIColor.blue
                }

                it("should apply color") {
                    style = [ .color: UIColor.red ]

                    label.styleInline = style

                    expect(label.textColor) == UIColor.red
                }
            }
        }
    }
}
