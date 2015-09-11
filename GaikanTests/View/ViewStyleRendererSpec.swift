//
// This file is part of Gaikan
//
// Created by JC on 10/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Quick
import Nimble
import Gaikan

class ViewStyleRendererSpec: QuickSpec {

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe("render style") {
            var style: StyleRule!

            context("when applying property") {

                it("should apply tintColor") {
                    style = [ .TintColor: UIColor.redColor()]

                    view.applyStyle(style)

                    expect(view.tintColor) == UIColor.redColor()
                }

                it("should apply border") {
                    style = [ .Border: Border(width: 3, color: UIColor.blackColor()) ]

                    view.applyStyle(style)

                    expect(view.layer.borderWidth) == 3
                    expect(view.layer.borderColor.map { UIColor(CGColor: $0) }).to(equal(UIColor.blackColor()))
                }

                it("should apply visible") {
                    style = [ .Visible: false ]

                    view.applyStyle(style)

                    expect(view.hidden) == false
                }
            }
        }
    }
}