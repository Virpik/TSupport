//
//  TData.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import Foundation

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
