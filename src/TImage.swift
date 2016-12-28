//
//  TImage.swift
//  TSuppot
//
//  Created by Virpik on 28/12/2016.
//  Copyright © 2016 Sybis. All rights reserved.
//

import UIKit

public extension UIImage {
    public convenience init?(color: UIColor? = UIColor.clear, size: CGSize = CGSize(width: 0.5, height: 0.5)) {
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        color?.setFill()
        
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        
        self.init(cgImage: cgImage)
    }
}


public class TImage: UIImage {

}
