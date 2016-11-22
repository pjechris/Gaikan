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

        describe("styleInline") {
            var style: StyleRule!

            context("when giving style") {

                it("should apply tintColor") {
                    style = [ .tintColor: UIColor.red ]

                    view.styleInline = style

                    expect(view.tintColor) == UIColor.red
                }

                it("should apply border") {
                    style = [ .border: Border(width: 3, color: UIColor.black) ]

                    view.styleInline = style

                    expect(view.layer.borderWidth) == 3
                    expect(view.layer.borderColor.map { UIColor(cgColor: $0) }).to(equal(UIColor.black))
                }

                it("should apply visible") {
                    style = [ .visible: false ]

                    view.styleInline = style
                    
                    expect(view.isHidden) == true
                }
            }
        }

        describe("styleState") {
            var style: Style!

            beforeEach {
                style = Style() { (styleRule:inout StyleRule) in
                        styleRule.tintColor = UIColor.red
                    }
                    .state("newState", [.tintColor: UIColor.blue])
            }

            context("when setting") {
                beforeEach {
                    view.styleClass = style
                    view.styleState = "newState"
                }

                it("should apply state tintColor") {
                    expect(view.tintColor) == UIColor.blue
                }
            }
        }

    }
}
