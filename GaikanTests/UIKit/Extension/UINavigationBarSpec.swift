//
// This file is part of Gaikan
//
// Created by Simone Civetta on 26/02/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import Quick
import Nimble
import Gaikan

class UINavigationBarSpec: QuickSpec {
    override func spec() {
        var navigationBar: UINavigationBar!

        beforeEach {
            navigationBar = UINavigationBar()
        }

        describe("styleInline") {
            var style: StyleRule!

            context("when giving style") {
                it("should inherit view styles") {
                    style = [ .tintColor: UIColor.blue ]

                    navigationBar.styleInline = style

                    expect(navigationBar.tintColor) == UIColor.blue
                }

                it("should apply a title font") {
                    style = [ .font: UIFont.systemFont(ofSize: 42.0) ]

                    navigationBar.titleStyle.styleInline = style

                    expect(navigationBar.titleTextAttributes![NSFontAttributeName] as? UIFont) == UIFont.systemFont(ofSize: 42.0)
                }

                it("should apply a foreground color to the title") {
                    style = [ .color: UIColor.blue ]
                    
                    navigationBar.titleStyle.styleInline = style
                    
                    expect(navigationBar.titleTextAttributes![NSForegroundColorAttributeName] as? UIColor) == UIColor.blue
                }
                
                it("should apply a shadow to the title") {
                    let shadow = NSShadow()
                    shadow.shadowOffset = CGSize(width: 2, height: 3)
                    
                    style = [ .textShadow: shadow ]
                    
                    navigationBar.titleStyle.styleInline = style
                    
                    expect(navigationBar.titleTextAttributes![NSShadowAttributeName] as? NSShadow) == shadow
                }
            }
        }
    }
}
