//
//  File.swift
//  
//
//  Created by Tom Biel on 11/13/19.
//

import Foundation


open class URLBuilder {
    
    open func testUrl() -> URL? {
        var comp = URLComponents()
        
        comp.scheme = "https"
        comp.host = "www.test.com"
        comp.path = "ddd2"
        comp.queryItems = [
            URLQueryItem(name: "name", value: "tom"),
            URLQueryItem(name: "scope", value: "search")
        ]
        
        return comp.url
    }
}
