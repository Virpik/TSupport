//
//  TTableViewRow.swift
//  Starateli
//
//  Created by Virpik on 10/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import UIKit

public class TTableViewRow<Model:TTableViewRowModel, Cell:UITableViewCell>:TTableViewRowInterfase{
    public typealias buildFunc = ((_ item:Model?, _ cell:Cell, _ indexPath:IndexPath)->Void)
    
    private(set) public var identifier:String?;
    private(set) public var cellClass:AnyClass;
    private(set) public var model:Model?;
    private(set) public var builder: buildFunc?;
    
    public var expanded:Bool = true;
    
    public init(model:Model?, identifier:String? = nil, expanded:Bool = true, builder:buildFunc? = nil){
        self.expanded = expanded;
        self.identifier = identifier;
        self.model = model;
        self.cellClass = Cell.classForCoder();
        self.builder = builder;
    }
    
    public func build(cell:UITableViewCell, indexPath:IndexPath){
        if let _cell = cell as? Cell{
            self.builder?(self.model, _cell, indexPath);
        }
    }
}
