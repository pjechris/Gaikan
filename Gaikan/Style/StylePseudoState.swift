//
// This file is part of Gaikan
//
// Created by JC on 14/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
 Used to define a special state of an element.
 As element can be in multiple states at the same time (like disabled and on), pseudo classes are defined as a UInt enum.
 The bigger the value, the higher priority it has
**/
public enum StylePseudoState : UInt {
    case highlighted
    case disabled
    case selected

    case on
}
