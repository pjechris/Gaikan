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
    let backgroundLayer = CALayer()
    let borderLayer = CALayer()

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

        let border = style.border ?? Border(width: 0, color: nil)

        self.borderLayer.borderWidth = border.width
        self.borderLayer.borderColor = border.color?.cgColor

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let ctx = CGContext(data: nil, width: Int(self.bounds.size.width), height: Int(self.bounds.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: 6)

        guard let context = ctx,
            let background = style.background else {
            return
        }

        for bg in Background(background).backgrounds {
            bg.render(inContext: context)
        }

        self.backgroundLayer.contents = context.makeImage()
    }
}
