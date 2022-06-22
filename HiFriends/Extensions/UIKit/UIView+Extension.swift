//
//  UIView+Extension.swift
//  HiFriends
//
//  Created by Anna Nosyk on 22/06/2022.
//

import UIKit

extension UIView {
    
    // gradien for button
    func applyGradients(cornerRadius: CGFloat) {
        
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: .startGradientColor(), endColor: .endGradienColor())
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        
    }
}
