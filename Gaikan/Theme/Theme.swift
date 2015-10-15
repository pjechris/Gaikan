//
//  Theme.swift
//  Gaikan
//
//  Created by JC on 14/10/15.
//  Copyright © 2015 fr.akane. All rights reserved.
//

import Foundation

public protocol Theme {
    func styles() -> [String:Style]
}