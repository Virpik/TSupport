//
//  TExtensions.swift
//  Starateli
//
//  Created by Virpik on 02/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    public static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension Int {
    public var degreesToRadians: Double { return Double(self) * .pi / 180 }
    public var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}

extension FloatingPoint {
    public var degreesToRadians: Self { return self * .pi / 180 }
    public var radiansToDegrees: Self { return self * 180 / .pi }
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


extension Date {
    public struct Formatter {
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
    
    public var iso1: String {
        return Formatter.iso1.string(from: self)
    }
    
    public var iso2: String {
        return Formatter.iso2.string(from: self)
    }
}

extension String {
    public var dateFromIso1: Date? {
        return Date.Formatter.iso1.date(from: self)
    }
    
    public var dateFromIso2: Date? {
        return Date.Formatter.iso2.date(from: self)
    }
    
}


