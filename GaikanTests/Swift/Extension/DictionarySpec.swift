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
@testable import Gaikan

class DictionarySpec: QuickSpec {
    override func spec() {
        describe("merge") {
            var dictionary1: [String:String?]!

            context("when value is replaced") {
                context("with nil") {
                    beforeEach {
                        let dictionary2: [String:String?] = [ "hello": nil ]

                        dictionary1 = [ "foo": "bar", "hello": "world" ]
                        dictionary1.gaikan_merge(dictionary2)
                    }

                    it("should exist") {
                        expect(dictionary1["hello"]).toNot(beNil())
                    }

                    it("should CONTAIN nil") {
                        expect(dictionary1["hello"]!).to(beNil())
                    }
                }
            }

            context("when value is added") {
                context("with nil") {
                    beforeEach {
                        let dictionary2: [String:String?] = [ "hello": nil ]

                        dictionary1 = [ "foo": "bar" ]
                        dictionary1.gaikan_merge(dictionary2)
                    }

                    it("should exist") {
                        expect(dictionary1["hello"]).toNot(beNil())
                    }

                    it("should CONTAIN nil") {
                        expect(dictionary1["hello"]!).to(beNil())
                    }
                }
            }
        }
    }
}