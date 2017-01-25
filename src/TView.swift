//
//  TView.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

public extension UIView {
    public func renderImage()->UIImage? {
        
        self.layoutIfNeeded()
        
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, scale)
        
        if let context = UIGraphicsGetCurrentContext(){
            self.layer.render(in: context)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            return image
        }
        
        return nil
    }
}

public extension UIView{
    
    @IBInspectable public var tBColor:UIColor? {
        get{
            
            if let cgColor = self.layer.borderColor{
                return UIColor(cgColor: cgColor)
            }
            
            return nil
        }
        
        set(value){
            self.layer.borderColor = value?.cgColor
        }
    }
    
    @IBInspectable public var tBWidth:Float {
        get{
            return self.layer.borderWidth.float
        }
        
        set(value){
            self.layer.borderWidth = value.cgFloat
        }
    }
    
    @IBInspectable public var tBRadius:Float {
        get{
            return self.layer.bounds.height.float / self.layer.cornerRadius.float
        }
        
        set(value){
            self.layer.cornerRadius = self.layer.bounds.height * value.cgFloat
        }
    }
}

public class TView: UIView {

}
