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
    
    public var styleState: String? {
        didSet {
            self.computeStyle()
        }
    }
    
    public func updateStyle() {
        self.targetView.updateStyle()
    }
    
    public func computeStyle() {
        guard let style = self.styleClass else {
            return
        }
        
        let states = StyleState.states(fromView: self.targetView)
        var computedStyle = style.style
        
        for state in states {
            computedStyle = style.states[state].map { $0.extends(computedStyle) } ?? computedStyle
        }
        
        self.computedStyle = computedStyle
    }
    
    public func applyStyle(style: StyleRule) {
        self.computedStyle = style
    }
    
    public static func keyPathsAffectingStyle() -> [String] {
        return []
    }
}