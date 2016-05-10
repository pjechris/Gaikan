//
// This file is part of Gaikan
//
// Created by JC on 10/12/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

enum StyleState {
    case PseudoState(StylePseudoState)
    case Custom(String)
}

extension StyleState {
    static func states<T:Stylable>(element: T) -> [StyleState] {
        var states: [StyleState] = []

        if let control = element as? UIControl {
            if (control.highlighted) {
                states.append(.PseudoState(.Highlighted))
            }

            if (!control.enabled) {
                states.append(.PseudoState(.Disabled))
            }

            if (control.selected) {
                states.append(.PseudoState(.Selected))
            }

            if let switcher = control as? UISwitch {
                if (switcher.on) {
                    states.append(.PseudoState(.On))
                }
            }
        }

        if let customState = element.styleState {
            states.append(.Custom(customState))
        }
        
        return states
    }
}

extension StyleState : Hashable {
    var hashValue: Int {
        switch (self) {
        case .PseudoState(let state):
            return state.hashValue
        case .Custom(let state):
            return state.hashValue
        }
    }
}

func ==(lhs: StyleState, rhs: StyleState) -> Bool {
    switch (lhs, rhs) {
    case (.PseudoState(let state1), .PseudoState(let state2)):
        return state1 == state2
    case (.Custom(let state1), .Custom(let state2)):
        return state1 == state2
    default:
        return false
    }
}