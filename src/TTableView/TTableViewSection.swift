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
    
    public private(set) var rows:[TTableViewRowInterface] = [];
    
    public var expanded:Bool = true;
    
    public init(identifier:String? = nil, expanded:Bool = true, rows:TTableViewRowInterface...) {
        self.expanded = expanded;
        self.identifier = identifier;
        self.rows = rows;
        self.calcExpandedRows();
    }
    
    public init(identifier:String? = nil, expanded:Bool = true, rows:[TTableViewRowInterface]) {
        self.expanded = expanded;
        self.identifier = identifier;
        self.rows = rows;
        self.calcExpandedRows();
    }
    
    
    public func append(row:TTableViewRowInterface){
        self.append(rows: [row])
    }
    
    public func append(rows:[TTableViewRowInterface]){
        self.rows.append(contentsOf: rows)
        self.calcExpandedRows()
    }
    
    public func insert(row:TTableViewRowInterface, index:Int){
        self.insert(rows: [row], index: index)
    }
    
    public func insert(rows:[TTableViewRowInterface], index:Int){
        self.rows.insert(contentsOf: rows, at: index)
        self.calcExpandedRows()
    }
    
    public func delete(row:TTableViewRowInterface){
        for (index, tRow) in self.rows.enumerated() {
            if (tRow.identifier == row.identifier){
                self.delete(rowAtIndex: index);
                break
            }
        }
    }
    
    public func delete(rows:[TTableViewRowInterface]){
        rows.forEach { (row) in
            self.delete(row: row)
        }
    }
    
    public func delete(rowAtIndex:Int){
        self.rows.remove(at: rowAtIndex)
        self.calcExpandedRows()
    }
    
    public func delete(rowsAtIndexs:[Int]){
        rowsAtIndexs.forEach { (index) in
            self.rows.remove(at: index)
            self.calcExpandedRows()
        }
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
