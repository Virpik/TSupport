//
//  TUIViewController.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

extension UIViewController{
    @IBInspectable var TClearBackButton:Bool{
        get { return true }
        set(value) {
            if (!value){
                return
            }
            
            let newBackButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil);
            self.navigationItem.backBarButtonItem = newBackButton;
        }
    }
}

class TViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
