//
//  UIImageView+Extension.swift
//  HiFriends
//
//  Created by Anna Nosyk on 08/06/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
    
    
   
}
