//
//  TString.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import Foundation

extension String {
    var localise:String {
        get{
            return self.localise();
        }
    }
    
    func localise(comment:String? = "")->String{
        return  NSLocalizedString(self, comment: "");
    }
}
