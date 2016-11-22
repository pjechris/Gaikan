//
//  ConstraintRenderer.swift
//  Gaikan
//
//  Created by pjechris on 30/08/16.
//  Copyright © 2016 fr.akane. All rights reserved.
//

import Foundation

class ConstraintRenderer {
    class func render(_ view: UIView, styleRule: StyleRule) {
        self.addDimension(styleRule.height, to: view, attribute: .height, relation: .equal)
        self.addDimension(styleRule.maxHeight, to: view, attribute: .height, relation: .lessThanOrEqual)
        self.addDimension(styleRule.minHeight, to: view, attribute: .height, relation: .greaterThanOrEqual)

        self.addDimension(styleRule.width, to: view, attribute: .width, relation: .equal)
        self.addDimension(styleRule.maxWidth, to: view, attribute: .width, relation: .lessThanOrEqual)
        self.addDimension(styleRule.minWidth, to: view, attribute: .width, relation: .greaterThanOrEqual)
    }

    fileprivate class func addDimension(_ constraint: Constraint?, to view: UIView, attribute: NSLayoutAttribute, relation: NSLayoutRelation) {
        let identifier = "gaikan-\(relation.identifier())\(attribute.identifier().capitalized))"
        let index = view.dimensions.index { $0.identifier == identifier }
        var layoutConstraint: NSLayoutConstraint

        // Remove layoutConstraint if constraint nil but already active (from a previously pass)
        guard let constraint = constraint else {
            if let index = index {
                view.dimensions[index].isActive = false
            }

            return
        }

        if let index = index {
            layoutConstraint = view.dimensions[index]
        }
        else {
            layoutConstraint = NSLayoutConstraint(item: view,
                                                  attribute: attribute,
                                                  relatedBy: relation,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 0)
            layoutConstraint.identifier = identifier

            view.dimensions.append(layoutConstraint)
        }

        // Deactivate constraint if priority changing from/to required
        if (layoutConstraint.priority != constraint.priority) {
            if (constraint.priority == UILayoutPriorityRequired || layoutConstraint.priority == UILayoutPriorityRequired) {
                layoutConstraint.isActive = false
            }
        }

        layoutConstraint.constant = CGFloat(constraint.constant)
        layoutConstraint.priority = constraint.priority
        layoutConstraint.isActive = true
    }
}
