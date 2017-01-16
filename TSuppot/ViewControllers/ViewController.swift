//
//  ViewController.swift
//  TSuppot
//
//  Created by Virpik on 27/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

struct TTitle:TTableViewRowModel{
    typealias TypeCell = TMenuItemCell

    var title:String = "";
    var segueIdendifier:String?;
}

class ViewController: UIViewController {

    @IBOutlet private var tableView:UITableView!
    
    private var tTableView:TTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tTableView = TTableView(tableView: tableView)
        self.tTableView.setupAutomaticDimension()
        
        let title = TTitle(title:"TTableView", segueIdendifier: "tShowTTableViewExampleSegue");
        let row = TTableViewRow(model:title, builder:self.builderMenuItemCell, didSelectAction:self.didSelectMenuItemCell)
        let section = TTableViewSection(rows:row)
        
        self.tTableView.append(section: section)
    }

    private func didSelectMenuItemCell(_ item: TTitle?, _ cell: TMenuItemCell, _ indexPath: IndexPath){
        if let segueIdendifier = item?.segueIdendifier{
            self.performSegue(withIdentifier: segueIdendifier, sender: self)
        }
    }
    
    private func builderMenuItemCell(_ item: TTitle?, _ cell: TMenuItemCell, _ indexPath: IndexPath){
        cell.labelTitle.text = item?.title;
    }
}

