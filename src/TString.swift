//
//  TString.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import Foundation

fileprivate enum TStringDecline:String{
    case TOne, TMany, TOther
}

public extension String {
    public var localise:String {
        get{
            return self.localise()
        }
    }
    
    public func localise(comment:String? = "", count:Int? = nil) -> String{
        var str = self
        
        if let _count = count {
            str +=  "-"+self.declension(_count).rawValue
        }
        
        return  NSLocalizedString(str, comment: "")
    }
    
    private func declension(_ count:Int)->TStringDecline{
        
        if ( count % 10 == 1 && count != 11 ){
            return .TOne
        }
        
        if ( count >= 5 && count <= 20 ){
            return .TMany
        }
        
        if ( count % 10 >= 5 || count % 10 == 0 ){
            return .TMany
        }
        
        if ( count % 10 >= 2 && count % 10 <= 4  ){
            return .TOther
        }
        
        return .TOther
    }
}
