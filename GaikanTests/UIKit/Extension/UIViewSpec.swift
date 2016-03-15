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
@testable import Gaikan

class UIViewSpec: QuickSpec {

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe("applyStyle") {
            var style: StyleRule!

            context("when giving style") {

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
                    
                    expect(view.hidden) == true
                }
            }
        }

        describe("styleState") {
            var style: Style!

            beforeEach {
                style = Style() { (inout styleRule:StyleRule) in
                        styleRule.tintColor = UIColor.redColor()
                    }
                    .state("newState", [.TintColor: UIColor.blueColor()])
            }

            context("when setting") {
                beforeEach {
                    view.stylesRef = ["test":style]
                    view.styleName = "test"
                    view.styleState = "newState"
                }

                it("should apply state tintColor") {
                    expect(view.tintColor) == UIColor.blueColor()
                }
            }
        }

    }
}