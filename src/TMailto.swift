//
//  TMailto.swift
//  Starateli
//
//  Created by Virpik on 24/01/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

extension URL {
    init?(string:String, query:[String:Any]){
        var sUrl = string
        
        for (index, item) in query.enumerated(){
            if index == 0 {
                sUrl += "?"
            }
            
            if index > 0{
                sUrl += "&"
            }
            
            sUrl += item.key + "=" + "\(item.value)"
        }
        if let str = sUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            sUrl = str
        }
        
        
        self.init(string:sUrl)
    }
}

public struct TMailto {
    
    public var subject:String?
    public var body:String?
    
    public var url:URL?{
        
        var query: [String:Any] = [:]
        
        if let subject = self.subject {
            query["subject"] = subject
        }
        
        if let body = self.body {
            query["body"] = body
        }
        let sUrl = "mailto:" + self.sUrl
        
        return URL(string:sUrl, query:query)
    }
    
    private var sUrl:String
    
    public init(email:String, subject:String? = nil, body:String? = nil){
        self.sUrl = email
        self.subject = subject
        self.body = body
    }
}
