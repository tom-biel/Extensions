//
//  NSGestureRecognizer.swift
//  Shortcuts
//
//  Created by Tom Biel on 10/19/19.
//  Copyright © 2019 Imagam. Inc. All rights reserved.
//

#if os(macOS)

import AppKit

public extension NSGestureRecognizer {
    
    private class CallbackWrapper {
        
        let callback: NSGestureRecognizer.Callback
        weak var gestureRecognizer: NSGestureRecognizer?
        
        init(callback:@escaping NSGestureRecognizer.Callback) {
            self.callback = callback
        }
        
        @objc func action(_ sender:NSGestureRecognizer) {
            callback(gestureRecognizer!)
        }
    }
    
    fileprivate struct AssociatedObjectKeys {
        static var callbackWrapper = "NSGestureRecognizer_CallbackWrapper"
    }
    
    typealias Callback = ((NSGestureRecognizer) -> Void)
    
    convenience init(callback: @escaping Callback) {
        
        let wrapper = CallbackWrapper(callback: callback)
        
        self.init(target:wrapper, action:#selector(CallbackWrapper.action(_:)))
        
        // use associated object to retain wrapper as
        // NSGestureRecognizer target uses weak reference
        objc_setAssociatedObject(self, &AssociatedObjectKeys.callbackWrapper, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        wrapper.gestureRecognizer = self
    }
}
#elseif os(iOS) || os(watchOS)
#endif
