//
//  TColor.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

public extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(), green: .random(), blue:  .random(), alpha: 1.0)
    }
}

public extension UIColor {
    
    convenience init(hex:String){
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            self.init();
            return;
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0;
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0;
        let blue =  CGFloat(rgbValue & 0x0000FF) / 255.0;
        let alpha = CGFloat(1.0)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha);
    }
}
