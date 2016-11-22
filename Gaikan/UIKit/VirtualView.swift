//
//  VirtualView.swift
//  Gaikan
//
//  Created by Simone Civetta on 17/03/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

open class VirtualView<TargetView: UIView> : NSObject, Stylable {
    
    fileprivate let targetView: TargetView
    
    init(targetView: TargetView) {
        self.targetView = targetView
    }
    
    open var styleClass: Style? {
        didSet { self.computeStyle() }
    }

    open var styleInline: StyleRule? {
        didSet { self.computeStyle() }
    }
    
    open var styleState: String? {
        didSet { self.computeStyle() }
    }

    open func updateStyle() {
        self.targetView.updateStyle()
    }

    open static func keyPathsAffectingStyle() -> [String] {
        return []
    }
}
