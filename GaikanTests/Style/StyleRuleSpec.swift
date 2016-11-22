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
                    style = StyleRule() { (style: inout StyleRule) -> () in
                        style.color = UIColor.blue
                    }
                }

                it("should initialize color") {
                    expect(style.color) == UIColor.blue
                }
            }
        }

        describe("extends") {
            beforeEach {
                style = [ .color: UIColor.blue, .tintColor: nil ]
            }

            context("when extending properties") {
                it("it should take new value") {
                    let newStyle: StyleRule = [ .color: UIColor.black ]

                    expect(newStyle.extends(style).color) == UIColor.black
                }
            }

            context("when adding properties") {
                it("should be added to style") {
                    let font = UIFont.systemFont(ofSize:22)
                    let newStyle: StyleRule = [ .font: font ]

                    expect(newStyle.extends(style).font) == font
                }
            }

            context("when nullyfing a property") {
                it("it should be nil") {
                    var newStyle: StyleRule = [ .color: nil ]

                    newStyle.extends(style)
                    expect(newStyle.color).to(beNil())
                }
            }

            context("multiple styles") {
                context("with a nil style") {
                    it("should merge valid ones") {
                        var newStyle: StyleRule = [:]

                        newStyle = newStyle.extends(nil, style)
                        expect(newStyle.color) == UIColor.blue
                    }

                    it("should add all properties") {
                        var newStyle: StyleRule = [:]

                        newStyle = newStyle.extends(style, [ .tintColor: UIColor.green ])

                        expect(newStyle.color) == UIColor.blue
                        expect(newStyle.tintColor) == UIColor.green
                    }
                }
            }

        }
    }
}
