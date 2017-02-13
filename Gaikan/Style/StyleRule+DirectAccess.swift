//
// This file is part of Gaikan
//
// Created by JC on 17/06/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public extension StyleRule {
    public var background: BackgroundValue? {
        get { return self[.background].map { return $0 as! BackgroundValue } }
        set { self.attributes[.background] = newValue }
    }

    public var border: Border? {
        get { return self[.border].map { return $0 as! Border } }
        set { self.attributes[.border] = newValue }
    }

    public var clip: Bool {
        get { return self[.clip].map { return $0 as! Bool } ?? false }
        set { self.attributes[.clip] = newValue }
    }

    public var corners: Corners? {
        get { return self[.cornerRadius].map { return $0 as! Corners } }
        set { self.attributes[.cornerRadius] = newValue }
    }

    public var color: UIColor? {
        get { return self[.color].map { return $0 as! UIColor } }
        set { self.attributes[.color] = newValue }
    }

    public var font: UIFont? {
        get { return self[.font].map { return $0 as! UIFont } }
        set { self.attributes[.font] = newValue }
    }

    public var height: Constraint? {
        get { return self[.height].map { $0 as! Constraint } }
        set { self.attributes[.height] = newValue }
    }

    public var margin: UIEdgeInsets? {
        get { return self[.margin].map { return $0 as! UIEdgeInsets } }
        set { self.attributes[.margin] = newValue }
    }

    public var maxHeight: Constraint? {
        get { return self[.maxHeight].map { $0 as! Constraint } }
        set { self.attributes[.maxHeight] = newValue }
    }

    public var maxWidth: Constraint? {
        get { return self[.maxWidth].map { $0 as! Constraint } }
        set { self.attributes[.maxWidth] = newValue }
    }

    public var minHeight: Constraint? {
        get { return self[.minHeight].map { $0 as! Constraint } }
        set { self.attributes[.minHeight] = newValue }
    }

    public var minWidth: Constraint? {
        get { return self[.minWidth].map { $0 as! Constraint } }
        set { self.attributes[.minWidth] = newValue }
    }

    /// value must be between 0 and 100
    /// default is 100
    public var opacity: Double {
        get { return self[.opacity].map { return $0 as! Double } ?? 100 }
        set { self.attributes[.opacity] = newValue }
    }

    public var shadow: NSShadow? {
        get { return self[.shadow].map { return $0 as! NSShadow } }
        set { self.attributes[.shadow] = newValue }
    }

    public var textAlign: NSTextAlignment? {
        get { return self[.textAlign].map { return $0 as! NSTextAlignment } }
        set { self.attributes[.textAlign] = newValue }
    }

    public var textOverflow: NSLineBreakMode? {
        get { return self[.textOverflow].map { return $0 as! NSLineBreakMode } }
        set { self.attributes[.textOverflow] = newValue }
    }

    public var tintColor: UIColor? {
        get { return self[.tintColor].map { return $0 as! UIColor } }
        set { self.attributes[.tintColor] = newValue }
    }

    public var transform: CATransform3D {
        get { return self[.transform].map { return $0 as! CATransform3D } ?? CATransform3DIdentity }
        set { self.attributes[.transform] = newValue }
    }

    public var visible: Bool? {
        get { return self[.visible].map { return $0 as! Bool } }
        set { self.attributes[.visible] = newValue }
    }

    public var width: Constraint? {
        get { return self[.width].map { $0 as! Constraint } }
        set { self.attributes[.width] = newValue }
    }

    public var textShadow: NSShadow? {
        get { return self[.textShadow].map { return $0 as! NSShadow } }
        set { self.attributes[.textShadow] = newValue }
    }
}
