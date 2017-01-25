
//
//  TSupport.swift
//  Starateli
//
//  Created by Virpik on 12/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

public func async(_ block:@escaping ()->Void){
    DispatchQueue.global().async(execute: block)
}

public  func main(_ block:@escaping ()->Void){
    DispatchQueue.main.async(execute: block)
}

public func delay(_ delay: TimeInterval, _ block:@escaping ()->Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
}

public func firstRun(_ first:@escaping ()->Void, _ notFirst: (()->Void)? = nil){
    if (TSupport.shared.firstRun){
        first()
    }else{
        notFirst?()
    }
}

public class TSupport: AnyObject {
    
    public static let shared:TSupport = TSupport()
    
    private let tFirstRunKey = "tFirstRunKey"
    
    private(set) var firstRun:Bool
    
    init() {
        self.firstRun = !UserDefaults.standard.bool(forKey: tFirstRunKey)
        UserDefaults.standard.set(true, forKey: tFirstRunKey)
    }
}


public class TLabel:UILabel{
    
    override public func draw(_ rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        super.draw(UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}

public extension UIView {
    @IBInspectable public var tBRadiusGlobal:Float {
        get{
            return self.layer.cornerRadius.float
        }
        
        set(value){
            self.layer.cornerRadius = value.cgFloat;
        }
    }
}
