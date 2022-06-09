//
//  UILabel+Extension.swift
//  HiFriends
//
//  Created by Anna Nosyk on 08/06/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init (title:String, textColor: UIColor, font: UIFont?) {
        
        self.init()
        self.text = title
        self.textColor = textColor
        self.font = font
    }
}
