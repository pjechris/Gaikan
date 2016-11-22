//
// This file is part of Gaikan
//
// Created by JC on 10/12/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

enum StyleState {
    case pseudoState(StylePseudoState)
    case custom(String)
}

extension StyleState {
    static func states<T:Stylable>(_ element: T) -> [StyleState] {
        var states: [StyleState] = []

        if let control = element as? UIControl {
            if (control.isHighlighted) {
                states.append(.pseudoState(.highlighted))
            }

            if (!control.isEnabled) {
                states.append(.pseudoState(.disabled))
            }

            if (control.isSelected) {
                states.append(.pseudoState(.selected))
            }

            if let switcher = control as? UISwitch {
                if (switcher.isOn) {
                    states.append(.pseudoState(.on))
                }
            }
        }

        if let customState = element.styleState {
            states.append(.custom(customState))
        }
        
        return states
    }
}

extension StyleState : Hashable {
    var hashValue: Int {
        switch (self) {
        case .pseudoState(let state):
            return state.hashValue
        case .custom(let state):
            return state.hashValue
        }
    }
}

func ==(lhs: StyleState, rhs: StyleState) -> Bool {
    switch (lhs, rhs) {
    case (.pseudoState(let state1), .pseudoState(let state2)):
        return state1 == state2
    case (.custom(let state1), .custom(let state2)):
        return state1 == state2
    default:
        return false
    }
}
