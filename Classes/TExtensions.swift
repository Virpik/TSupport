//
//  TExtensions.swift
//  Starateli
//
//  Created by Virpik on 02/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    @IBInspectable var TCearBackButton:Bool{
        get { return true }
        set(value) {
            if (!value){
                return
            }
            
            let newBackButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil);
            self.navigationItem.backBarButtonItem = newBackButton;
        }
    }
}

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

extension UITableView{
    func register(atClass:AnyClass){
        let idendifier = self.cellIdendifier(atClass: atClass);
        let nib = UINib(nibName: "\(atClass)", bundle: nil);
        self.register(nib, forCellReuseIdentifier: idendifier);
    }
    
    func cell(atClass:AnyClass)->UITableViewCell?{
        return self.dequeueReusableCell(withIdentifier: self.cellIdendifier(atClass: atClass));
    }
    
    func cellIdendifier(atClass:AnyClass) -> String {
        return "\(atClass)";
    }
}

public extension UIImage {
    public convenience init?(color: UIColor? = UIColor.clear, size: CGSize = CGSize(width: 0.5, height: 0.5)) {
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        color?.setFill()
        
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        
        self.init(cgImage: cgImage)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(), green: .random(), blue:  .random(), alpha: 1.0)
    }
}

extension UIColor {
    
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

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

public extension String{
    var uInt32:UInt32{ if let int = UInt32(self) { return int}; return 0; }
    var float:Float{ if let int = Float(self) { return int}; return 0; }
    var double:Double{ if let int = Double(self) { return int}; return 0; }
    var int16:Int16{ if let int = Int16(self) { return int}; return 0; }
}

public extension Int{
    var uInt32:UInt32{ return UInt32(self) }
    var float:Float{ return Float(self) }
    var cgFloat:CGFloat{ return CGFloat(self) }
    var double:Double{ return Double(self) }
    var string:String{ return "\(self)" }
}

public extension Float{
    var uInt32:UInt32{ return UInt32(self) }
    var cgFloat:CGFloat{ return CGFloat(self) }
    var double:Double{ return Double(self) }
    var int:Int{ return Int(self) }
    var string:String{ return "\(self)" }
}

public extension CGFloat{
    var uInt32:UInt32{ return UInt32(self) }
    var float:Float{ return Float(self) }
    var double:Double{ return Double(self) }
    var int:Int{ return Int(self) }
    var string:String{ return "\(self)" }
}

public extension Double{
    var uInt32:UInt32{ return UInt32(self) }
    var float:Float{ return Float(self) }
    var cgFloat:CGFloat{ return CGFloat(self) }
    var int:Int{ return Int(self) }
    var string:String{ return "\(self)" }
}

public extension UInt32{
    var float:Float{ return Float(self) }
    var cgFloat:CGFloat{ return CGFloat(self) }
    var int:Int{ return Int(self) }
    var double:Double{ return Double(self) }
    var string:String{ return "\(self)" }
}

public extension NSNumber{
    var float:Float{ return Float(self) }
    var cgFloat:CGFloat{ return CGFloat(self) }
    var int:Int{ return Int(self) }
    var double:Double{ return Double(self) }
    var string:String{ return "\(self)" }
}

extension Data{
    var json:[String:AnyObject]? {
        
        do{
            return try JSONSerialization.jsonObject(with: self, options: .allowFragments) as?  [String : AnyObject];
        }catch _ {
        
        }
        
        return nil;
    }
    
    var string:String? {
        return String(data: self, encoding: String.Encoding.utf8);
    }
}

extension Date {
    struct Formatter {
        static let iso1: DateFormatter = {
            let formatter = DateFormatter();
            formatter.dateFormat = "yyyy-MM-dd'T'HH-mm-ss";
            return formatter
        }()
        
        static let iso2: DateFormatter = {
            let formatter = DateFormatter();
            formatter.dateFormat = "yyyy-MM-dd'T'HH-mm-ssZ";
            return formatter
        }()
        
    }
    
    
    var iso1: String {
        return Formatter.iso1.string(from: self)
    }
    
    var iso2: String {
        return Formatter.iso2.string(from: self)
    }
}

extension String {
    var dateFromIso1: Date? {
        return Date.Formatter.iso1.date(from: self)
    }
    
    var dateFromIso2: Date? {
        return Date.Formatter.iso2.date(from: self)
    }
    
}


