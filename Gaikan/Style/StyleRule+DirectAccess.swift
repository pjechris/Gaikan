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
        get { return self[.Background].map { return $0 as! BackgroundValue } }
        set { self.attributes[.Background] = newValue }
    }

    public var border: Border? {
        get { return self[.Border].map { return $0 as! Border } }
        set { self.attributes[.Border] = newValue }
    }

    public var clip: Bool {
        get { return self[.Clip].map { return $0 as! Bool } ?? false }
        set { self.attributes[.Clip] = newValue }
    }

    public var corners: Corners? {
        get { return self[.CornerRadius].map { return $0 as! Corners } }
        set { self.attributes[.CornerRadius] = newValue }
    }

    public var color: UIColor? {
        get { return self[.Color].map { return $0 as! UIColor } }
        set { self.attributes[.Color] = newValue }
    }

    public var font: UIFont? {
        get { return self[.Font].map { return $0 as! UIFont } }
        set { self.attributes[.Font] = newValue }
    }

    /// value must be between 0 and 100
    /// default is 100
    public var opacity: Double {
        get { return self[.Opacity].map { return $0 as! Double } ?? 100 }
        set { self.attributes[.Opacity] = newValue }
    }

    public var textAlign: NSTextAlignment? {
        get { return self[.TextAlign].map { return $0 as! NSTextAlignment } }
        set { self.attributes[.TextAlign] = newValue }
    }

    public var tintColor: UIColor? {
        get { return self[.TintColor].map { return $0 as! UIColor } }
        set { self.attributes[.TintColor] = newValue }
    }

    public var transform: CATransform3D {
        get { return self[.Transform].map { return $0 as! CATransform3D } ?? CATransform3DIdentity }
        set { self.attributes[.Transform] = newValue }
    }

    public var visible: Bool? {
        get { return self[.Visible].map { return $0 as! Bool } }
        set { self.attributes[.Visible] = newValue }
    }

    public var textShadow: NSShadow? {
        get { return self[.TextShadow].map { return $0 as! NSShadow } }
        set { self.attributes[.TextShadow] = newValue }
    }
}