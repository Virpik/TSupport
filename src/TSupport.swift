
//
//  TSupport.swift
//  Starateli
//
//  Created by Virpik on 12/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

public func async(_ block:@escaping ()->Void){
    DispatchQueue.global().async(execute: block);
}

public  func main(_ block:@escaping ()->Void){
    DispatchQueue.main.async(execute: block);
}

public func delay(_ delay: TimeInterval, _ block:@escaping ()->Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block);
}

class TSupport: AnyObject {
    
}
