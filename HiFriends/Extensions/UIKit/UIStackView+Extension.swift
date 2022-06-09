//
//  UIStackView+Extension.swift
//  HiFriends
//
//  Created by Anna Nosyk on 09/06/2022.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spasing: CGFloat) {
        self.init(arrangedSubviews:arrangedSubviews)
        self.axis = axis
        self.spacing = spasing
        
    }
}
