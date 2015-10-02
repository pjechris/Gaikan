//
// This file is part of Gaikan
//
// Created by JC on 12/09/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Quick
import Nimble
import Gaikan

class StyleRuleSpec: QuickSpec {
    override func spec() {
        var style: StyleRule!

        describe("init") {
            context("when passing block") {
                beforeEach {
                    style = StyleRule() { (inout style: StyleRule) -> () in
                        style.color = UIColor.blueColor()
                    }
                }

                it("should initialize color") {
                    expect(style.color) == UIColor.blueColor()
                }
            }
        }

        describe("extends") {
            beforeEach {
                style = [ .Color: UIColor.blueColor(), .TintColor: nil ]
            }

            context("when extending properties") {
                it("it should take new value") {
                    var newStyle: StyleRule = [ .Color: UIColor.blackColor() ]

                    expect(newStyle.extends(style).color) == UIColor.blackColor()
                }
            }

            context("when adding properties") {
                it("should be added to style") {
                    let font = UIFont.systemFontOfSize(22)
                    var newStyle: StyleRule = [ .Font: font ]

                    expect(newStyle.extends(style).font) == font
                }
            }

            context("when nullyfing a property") {
                it("it should be nil") {
                    var newStyle: StyleRule = [ .Color: nil ]

                    newStyle.extends(style)
                    expect(newStyle.color).to(beNil())
                }
            }

            context("multiple styles") {
                context("with a nil style") {
                    it("should merge valid ones") {
                        var newStyle: StyleRule = [:]

                        newStyle.extends(nil, style)
                        expect(newStyle.color) == UIColor.blueColor()
                    }

                    it("should add all properties") {
                        var newStyle: StyleRule = [:]

                        newStyle.extends(style, [ .TintColor: UIColor.greenColor() ])

                        expect(newStyle.color) == UIColor.blueColor()
                        expect(newStyle.tintColor) == UIColor.greenColor()
                    }
                }
            }

        }
    }
}