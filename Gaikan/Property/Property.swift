//
// This file is part of Gaikan
//
// Created by JC on 30/08/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/// Property that can be used to style a view
/// Keep this file Alphabetic ordered
public enum Property {
    case background
    case border
    case clip
    case color
    case cornerRadius
    case font
    case height
    /// view layoutMargins
    case margin
    case maxHeight
    case maxWidth
    case minHeight
    case minWidth
    case opacity
    case shadow
    case textAlign
    case textOverflow
    case textShadow
    case tintColor
    case transform
    case visible
    case width
}

public protocol TextStyler {
    var textColor: UIColor? { get set }
    var textAlignment: NSTextAlignment? { get set }
    var textOverflow: NSLineBreakMode? { get set }
    var textShadow: NSShadow? { get set }
}

public protocol FontStyler {
    var font: UIFont? { get set }
}

public protocol VisibilityStyler {
    var clipToBounds: Bool? { get set }
    var opacity: Double? { get set }
    var isVisible: Bool { get set }
}

public protocol DesignStyler {
    var border: Border? { get set }
    var background: Background? { get set }
    var cornerRadius: Corners? { get set }
    var tintColor: UIColor? { get set }
}
