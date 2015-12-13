//
// This file is part of Gaikan
//
// Created by JC on 18/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Quick
import Nimble
@testable import Gaikan

class StyleSpec: QuickSpec {
    override func spec() {
        var style: Style!

        beforeEach {
            style = Style() { (inout style: StyleRule) in
                style.color = UIColor.blueColor()
            }
        }

        describe("state") {
            context("when pseudo class does not exist yet") {
                it("should be nil") {
                    expect(style[.Highlighted]).to(beNil())
                }

                it("should add it") {
                    style = style.state(.Highlighted) { (inout style: StyleRule) -> () in
                    }

                    expect(style[.Highlighted]).toNot(beNil())
                }

                it("should not be merged with .Normal") {
                    style = style.state(.Highlighted) { (inout style: StyleRule) -> () in
                    }

                    expect(style[.Highlighted]?.color).to(beNil())
                }
            }

            context("when pseudo class exist") {
                beforeEach {
                    style = style.state(.Highlighted) { (inout style: StyleRule) -> () in
                        style.color = UIColor.greenColor()
                    }
                }

                it("should replace it") {
                    style = style.state(.Highlighted) { (inout style: StyleRule) -> () in
                    }

                    expect(style[.Highlighted]?.color).to(beNil())
                }
            }
        }
    }
}