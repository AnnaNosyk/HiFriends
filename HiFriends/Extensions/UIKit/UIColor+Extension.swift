//
//  UIColor+Extension.swift
//  HiFriends
//
//  Created by Anna Nosyk on 08/06/2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static func redButton() -> UIColor {
        return UIColor(named: "textColorButton") ?? .red
    }
    
    static func mainColor() -> UIColor {
        return UIColor(named: "mainColor") ?? .white
    }
    
    
    static func backGroundButton() -> UIColor {
        return UIColor(named: "backGroundButton") ?? .black
    }
    
    static func startGradientColor() -> UIColor {
        return UIColor(named: "startColor") ?? .black
    }
    
    static func endGradienColor() -> UIColor {
        return UIColor(named: "endColor") ?? .black
    }
    
    
    static func cellsBackGround() -> UIColor {
        return UIColor(named: "cellsBackGround") ?? .black
    }
    
    static func textDescriptionColor() -> UIColor {
        return UIColor(named: "textDescriptionColor") ?? .black
    }
    static func textMainColor() -> UIColor {
        return UIColor(named: "textMainColor") ?? .black
    }


    
    
    
}
