//
//  TTableView.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

extension UITableView{
    func register(atClass:AnyClass){
        let idendifier = self.cellIdendifier(atClass: atClass);
        let nib = UINib(nibName: "\(atClass)", bundle: nil);
        self.register(nib, forCellReuseIdentifier: idendifier);
    }
    
    func cell(atClass:AnyClass)->UITableViewCell?{
        return self.dequeueReusableCell(withIdentifier: self.cellIdendifier(atClass: atClass));
    }
    
    func cellIdendifier(atClass:AnyClass) -> String {
        return "\(atClass)";
    }
}


class TTableView: UITableView {}
