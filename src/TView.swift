//
//  TView.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable var tBColor:UIColor? {
        get{
            return UIColor(cgColor: self.layer.borderColor!);
        }
        
        set(value){
            self.layer.borderColor = value?.cgColor;
        }
    }
    
    @IBInspectable var tBWidth:Float {
        get{
            return self.layer.borderWidth.float;
        }
        
        set(value){
            self.layer.borderWidth = value.cgFloat;
        }
    }
    
    @IBInspectable var tBRadius:Float {
        get{
            return self.layer.bounds.height.float / self.layer.cornerRadius.float
        }
        
        set(value){
            self.layer.cornerRadius = self.layer.bounds.height * value.cgFloat;
        }
    }
}

class TView: UIView {

}
