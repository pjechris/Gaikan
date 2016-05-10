//
//  VirtualView.swift
//  Gaikan
//
//  Created by Simone Civetta on 17/03/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

public class VirtualView<TargetView: UIView> : NSObject, Stylable {
    
    private let targetView: TargetView
    
    init(targetView: TargetView) {
        self.targetView = targetView
    }
    
    public var styleClass: Style? {
        didSet { self.computeStyle() }
    }

    public var styleInline: StyleRule? {
        didSet { self.computeStyle() }
    }
    
    public var styleState: String? {
        didSet { self.computeStyle() }
    }

    public func updateStyle() {
        self.targetView.updateStyle()
    }

    public static func keyPathsAffectingStyle() -> [String] {
        return []
    }
}