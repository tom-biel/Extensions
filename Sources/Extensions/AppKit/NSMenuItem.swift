//
//  File.swift
//  
//
//  Created by Tom Biel on 11/11/19.
//

#if os(macOS)

import AppKit

public extension NSMenuItem {

    private class CallbackWrapper {
        
        let callback: NSMenuItem.Callback
        weak var menu: NSMenuItem?
        
        init(callback:@escaping NSMenuItem.Callback) {
            self.callback = callback
        }
        
        @objc func action(_ sender:NSMenuItem) {
            callback(menu!)
        }
    }
    
    fileprivate struct AssociatedObjectKeys {
        static var callbackWrapper = "NSGestureRecognizer_CallbackWrapper"
    }
    
    typealias Callback = ((NSMenuItem) -> Void)
    
    convenience init(title: String, keyEquivalent charCode: String, callback: @escaping Callback) {
        
        let wrapper = CallbackWrapper(callback: callback)
        
        self.init(title: title, action: #selector(NSMenuItem.CallbackWrapper.action(_:)), keyEquivalent: charCode)
        
        self.target = wrapper
        
        // use associated object to retain wrapper as
        // NSGestureRecognizer target uses weak reference
        objc_setAssociatedObject(self, &AssociatedObjectKeys.callbackWrapper, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        wrapper.menu = self
    }
}

#endif
