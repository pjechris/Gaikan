//
// This file is part of Gaikan
//
// Created by JC on 05/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol Background {
    typealias BackgroundValue

    static func render(value: BackgroundValue, intoView view: UIView)
}

public protocol BackgroundValue {
    func render(intoView view: UIView)
}