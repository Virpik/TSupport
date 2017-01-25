//
//  TUpdateInterface.swift
//  TSuppot
//
//  Created by Virpik on 16/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

public protocol TUpdateInterface{
    var isNeedUpdate:Bool { get }
    
    func updated()
}
