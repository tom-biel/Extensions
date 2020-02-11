//
//  File.swift
//  
//
//  Created by Tom Biel on 11/9/19.
//

import Foundation


extension NotificationCenter {
    
    @available(OSX 10.6, *)
    @discardableResult
    public func addObserver(forName name: NSNotification.Name?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        
        return self.addObserver(forName: name, object: nil, queue: nil, using: block)
    }
    
    @available(OSX 10.6, *)
    @discardableResult
    public func addObserver(forNames names:[NSNotification.Name], object obj: Any? = nil, queue: OperationQueue? = nil, using block: @escaping (Notification) -> Void) -> [NSObjectProtocol] {
        
        var returns = Array<NSObjectProtocol>()
        
        for name in names {
            let op = self.addObserver(forName: name, object: obj, queue: queue, using: block)
            returns.append(op)
        }
        
        return returns
    }
}
