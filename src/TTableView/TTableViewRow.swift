//
//  TTableViewRow.swift
//  Starateli
//
//  Created by Virpik on 10/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import UIKit

public protocol TTableViewRowInterface:TUpdateInterface{
    var identifier:String {get};
    var cellClass:AnyClass {get};
    var expanded:Bool {get set};
    var removable:Bool {get set};

    func build(cell:UITableViewCell, indexPath:IndexPath)
    func didSelect(cell:UITableViewCell, indexPath:IndexPath)
    func didDeselect(cell:UITableViewCell, indexPath:IndexPath)
    func willSelect(cell:UITableViewCell, indexPath:IndexPath)
    func delete(cell:UITableViewCell, indexPath:IndexPath)
}

public class TTableViewRow<Model:TTableViewRowModel>:TTableViewRowInterface{
    public typealias tTableViewRowFunc = ((_ item:Model?, _ cell:Model.TypeCell, _ indexPath:IndexPath)->Void)
    
    private(set) public var identifier:String;
    private(set) public var cellClass:AnyClass;
    private(set) public var model:Model?;
    
    public var removable:Bool = false;
    
    public var builder: tTableViewRowFunc?;
    public var didSelectAction: tTableViewRowFunc?;
    public var didDeselectAction: tTableViewRowFunc?;
    public var willSelectAction: tTableViewRowFunc?;
    public var deleteAction: tTableViewRowFunc?;

    public var expanded:Bool = true;
    
    public init(model:Model? = nil, identifier:String? = nil, expanded:Bool = true, removable:Bool = false, builder:tTableViewRowFunc? = nil, didSelectAction:tTableViewRowFunc? = nil, deleteAction:tTableViewRowFunc? = nil){
        
        self.expanded = expanded
        
        if let id = identifier {
            self.identifier = id
        }else{
            self.identifier = UUID.init().uuidString
        }
        
        self.model = model
        self.cellClass = Model.TypeCell().classForCoder;
        self.builder = builder
        self.removable = true
        self.didSelectAction = didSelectAction;
        self.deleteAction = deleteAction;
    }
    
    public var isNeedUpdate: Bool {
        if let model = self.model{
            return model.isNeedUpdate;
        }
        
        return false
    }
    
    public func updated() {
        if let model = self.model{
            return model.updated();
        }
    }
    
    public func build(cell:UITableViewCell, indexPath:IndexPath){
        if let _cell = cell as? Model.TypeCell{
            self.builder?(self.model, _cell, indexPath);
        }
    }
    
    public func didSelect(cell:UITableViewCell, indexPath:IndexPath){
        if let _cell = cell as? Model.TypeCell{
            self.didSelectAction?(self.model, _cell, indexPath);
        }
    }
    
    public func didDeselect(cell:UITableViewCell, indexPath:IndexPath){
        if let _cell = cell as? Model.TypeCell{
            self.didDeselectAction?(self.model, _cell, indexPath);
        }
    }

    
    public func willSelect(cell:UITableViewCell, indexPath:IndexPath){
        if let _cell = cell as? Model.TypeCell{
            self.willSelectAction?(self.model, _cell, indexPath);
        }
    }
    
    public func delete(cell:UITableViewCell, indexPath:IndexPath){
        if let _cell = cell as? Model.TypeCell{
            self.deleteAction?(self.model, _cell, indexPath);
        }
    }
}
