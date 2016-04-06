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

        describe("applyStyle") {
            var style: StyleRule!

            context("when giving style") {
                it("should inherit view styles") {
                    style = [ .TintColor: UIColor.blueColor() ]

                    navigationBar.applyStyle(style)

                    expect(navigationBar.tintColor) == UIColor.blueColor()
                }

                it("should apply a title font") {
                    style = [ .Font: UIFont.systemFontOfSize(42.0) ]

                    navigationBar.titleStyle.applyStyle(style)

                    expect(navigationBar.titleTextAttributes![NSFontAttributeName] as? UIFont) == UIFont.systemFontOfSize(42.0)
                }

                it("should apply a foreground color to the title") {
                    style = [ .Color: UIColor.blueColor() ]
                    
                    navigationBar.titleStyle.applyStyle(style)
                    
                    expect(navigationBar.titleTextAttributes![NSForegroundColorAttributeName] as? UIColor) == UIColor.blueColor()
                }
                
                it("should apply a shadow to the title") {
                    let shadow = NSShadow()
                    shadow.shadowOffset = CGSize(width: 2, height: 3)
                    
                    style = [ .TextShadow: shadow ]
                    
                    navigationBar.titleStyle.applyStyle(style)
                    
                    expect(navigationBar.titleTextAttributes![NSShadowAttributeName] as? NSShadow) == shadow
                }
            }
        }
    }
}