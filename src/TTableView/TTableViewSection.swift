//
//  TTableViewSection.swift
//  Starateli
//
//  Created by Virpik on 10/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

public class TTableViewSection:Any {
    public private(set) var identifier:String?;
    
    public var numberRows:Int = 0;
    
    public private(set) var rows:[TTableViewRowInterfase] = [];
    
    public var expanded:Bool = true;
    
    public init(identifier:String? = nil, expanded:Bool = true, rows:TTableViewRowInterfase...) {
        self.expanded = expanded;
        self.identifier = identifier;
        self.rows = rows;
        self.calcExpandedRows();
    }
    
    
    public init(identifier:String? = nil, expanded:Bool = true, rows:[TTableViewRowInterfase]) {
        self.expanded = expanded;
        self.identifier = identifier;
        self.rows = rows;
        self.calcExpandedRows();
    }
    
    
    public func expandRows(_ indexs:Int...) -> [Int]{
        return self.expandRows(indexs);
    }
    
    public func collapseRows(_ indexs:Int...) -> [Int]{
        return self.collapseRows(indexs);
    }
    
    public func expandRows(_ indexs:[Int]) -> [Int]{
        var result:[Int] = [];
        
        indexs.forEach { (index) in
            if (!self.rows[index].expanded){
                result.append(index);
                self.rows[index].expanded = true;
            }
        }
        
        self.calcExpandedRows();
        
        return result;
    }
    
    public func collapseRows(_ indexs:[Int]) -> [Int]{
        var result:[Int] = [];
        
        indexs.forEach { (index) in
            if (self.rows[index].expanded){
                result.append(index);
                self.rows[index].expanded = false;
            }
        }
        
        self.calcExpandedRows();
        
        return result;
    }
    
    private func calcExpandedRows(){
        let expanded = self.rows.filter { (item) -> Bool in
            return item.expanded;
        }
        self.numberRows = expanded.count;
    }
}
