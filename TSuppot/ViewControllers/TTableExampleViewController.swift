//
//  TTableViewExampleViewController.swift
//  TSuppot
//
//  Created by Virpik on 16/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import UIKit

struct TDateModel:TTableViewRowModel {
    typealias TypeCell = TDateItemCell
    
    let date:Date;
}

class TTableExampleViewController: UIViewController {

    @IBOutlet private var tableView:UITableView!
    
    private var tTableView:TTableView!
    
    private var dates:[TDateModel] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tTableView = TTableView(tableView: self.tableView)
        self.tTableView.setupAutomaticDimension()
        
        self.tTableView.append(section: TTableViewSection(rows:[]))
        
        self.addAction(sender: self)
        
        let rowAction = UITableViewRowAction(style: .normal, title: "") { (item, indexPath) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addAction(sender:AnyObject?){
        let date = TDateModel(date:Date())
        self.dates.append(date)
        
        let row = TTableViewRow(model: date,  builder: self.builderItemCell)
        row.removable = true
        
        let indexPath = IndexPath(row:0, section:0)
        
        self.tTableView.insertRows(rows: (row:row, indexPath: indexPath))
        
    }

    private func didSelectMenuItemCell(_ item: TDateModel?, _ cell: TDateItemCell, _ indexPath: IndexPath){
        
    }
    
    private func builderItemCell(_ item: TDateModel?, _ cell: TDateItemCell, _ indexPath: IndexPath){
        cell.labelText.text = item?.date.iso1;
    }
    
}
