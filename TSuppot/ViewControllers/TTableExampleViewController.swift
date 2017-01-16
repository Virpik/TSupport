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
        
        let row = TTableViewRow(model: TTitle(title: "BEGIN", segueIdendifier:nil))
        
        let defaultSection = TTableViewSection(rows:row)
        self.tTableView.append(section: defaultSection)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addAction(sender:AnyObject?){
        let date = TDateModel(date:Date())
        self.dates.append(date)
        
//        if let section = self.tTableView.sections.last{
//            let row = TTableViewRow(model:date, builder: self.builderItemCell)
//            section.append(row: row)
//        }
        
//        self.tableView.reloadData()
    }

    private func didSelectMenuItemCell(_ item: TDateModel?, _ cell: TDateItemCell, _ indexPath: IndexPath){
        
    }
    
    private func builderItemCell(_ item: TDateModel?, _ cell: TDateItemCell, _ indexPath: IndexPath){
        cell.labelText.text = item?.date.iso1;
    }
    
}
