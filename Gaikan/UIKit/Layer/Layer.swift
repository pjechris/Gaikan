//
//  Layer.swift
//  Gaikan
//
//  Created by pjechris on 22/11/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation
import UIKit

class StyleLayer : CALayer {
    let backgroundLayer = BackgroundLayer()
    let borderLayer = BorderLayer()

    var styleClass: StyleRule! {
        didSet {
            self.applyStyle()
        }
    }

    override var frame: CGRect {
        get { return super.frame }
        set {
            super.frame = newValue
            self.applyStyle()
        }
    }

    override init() {
        super.init()
        self.setupLayers()
    }

    override init(layer: Any) {
        super.init(layer: layer)
        self.setupLayers()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayers()
    }

    private func setupLayers() {
        self.contentsScale = UIScreen.main.scale
        self.backgroundLayer.contentsScale = UIScreen.main.scale
        self.borderLayer.contentsScale = UIScreen.main.scale
        self.addSublayer(self.backgroundLayer)
        self.addSublayer(self.borderLayer)
    }

    override func layoutSublayers() {
        self.backgroundLayer.frame = self.frame
        self.borderLayer.frame = self.frame
    }

    func applyStyle() {

        guard let style = self.styleClass else {
            return
        }

        self.backgroundLayer.background = style.background.map { Background($0) }
        self.borderLayer.border = style.border
    }
    
    override var cornerRadius: CGFloat {
        didSet {
            self.backgroundLayer.cornerRadius = cornerRadius
            self.borderLayer.cornerRadius = cornerRadius
        }
    }
}
