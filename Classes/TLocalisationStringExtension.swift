//
//  TLocalisationStringExtension.swift
//  Starateli
//
//  Created by Virpik on 07/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import Foundation
import CoreLocation

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

extension String {
    static let tLocalTitleCatalog:String = "TCatalog".localise;
    
    static let tLocalTitleListShop:String = "TListShop".localise;
    
    static let tLocalTitleSearch:String = "TSearch".localise;
    
    static let tLocalTitleHelp:String = "THelp".localise;
}
