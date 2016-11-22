//
//  NSLayoutRelation+Helpers.swift
//  Gaikan
//
//  Created by pjechris on 01/09/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

extension NSLayoutRelation {
    func identifier() -> String {
        switch (self) {
        case .equal:
            return "accurate"
        case .greaterThanOrEqual:
            return "min"
        case .lessThanOrEqual:
            return "max"
        }
    }
}
