//
// This file is part of Gaikan
//
// Created by JC on 26/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public extension UINavigationBar {
    
    fileprivate struct AssociatedKeys {
        static var VirtualView = "gaikan_virtualView"
    }
    
    public override func updateStyle() {
        super.updateStyle()

        if let computedStyle = self.computedStyle {
            ViewStyleRenderer.render(self, styleRule: computedStyle)
        }

        if let titleStyle = self.titleStyle.computedStyle {
            ViewStyleRenderer.render(self, titleStyle: titleStyle)
        }
    }
    
    public var titleStyle: VirtualView<UINavigationBar> {
        guard let title = objc_getAssociatedObject(self, &AssociatedKeys.VirtualView) as? VirtualView<UINavigationBar> else {
            let title = VirtualView(targetView: self)
            objc_setAssociatedObject(self, &AssociatedKeys.VirtualView, title as VirtualView<UINavigationBar>?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return title
        }
        return title
    }
}
