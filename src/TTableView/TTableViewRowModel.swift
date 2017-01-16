//
//  TTableViewRowModel.swift
//  TSuppot
//
//  Created by Virpik on 16/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import UIKit


public protocol TTableViewRowModel:TUpdateInterface{
    associatedtype TypeCell:UITableViewCell;
}

public extension TTableViewRowModel{
    public var isNeedUpdate:Bool {
        return false
    }
    
    public func updated(){
        
    }
}
