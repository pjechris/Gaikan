//
//  ConstraintRendererSpec.swift
//  Gaikan
//
//  Created by pjechris on 10/09/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Gaikan

class ConstraintRendererSpec : QuickSpec {
    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe("render") {
            var style: StyleRule!

            context("style") {
                beforeEach {
                    style = StyleRule()
                    style.width = 42

                    ConstraintRenderer.render(view, styleRule: style)
                }

                it("adds constraint") {
                    expect(view.constraints.count) == 1
                }

                context("changed") {
                    var newStyle = StyleRule()

                    beforeEach {
                        newStyle.width = 32

                        ConstraintRenderer.render(view, styleRule: newStyle)
                    }

                    it("keeps constraint") {
                        expect(view.constraints.count) == 1
                    }

                    it("applies changed constraint") {
                        expect(view.constraints.first?.constant) == CGFloat(newStyle.width!.constant)
                    }
                }

                context("removed") {
                    beforeEach {
                        ConstraintRenderer.render(view, styleRule: StyleRule())
                    }

                    it("removes constraint") {
                        expect(view.constraints.count) == 0
                    }
                }
            }



            context("removed constraint") {
                beforeEach {
                    style = StyleRule()

                    style.width = 50

                }
            }
        }
    }
}
