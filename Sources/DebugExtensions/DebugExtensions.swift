//
//  File.swift
//  
//
//  Created by Tom Biel on 11/2/19.
//

import Foundation

// CF_IMPLICIT_BRIDGING_ENABLED
// #pragma clang assume_nonnull begin  // also get rid of !s
// #pragma clang assume_nonnull end
// CF_IMPLICIT_BRIDGING_DISABLED

struct Extensions {
    var text = "Hello, World!"
}


@inline(__always) public func debugPrint<T>(address: T) {
    
    withUnsafePointer(to: &T) {
        print(" str value \(T) has address: \($0)")
        
        Unmanaged.passRetained(<#T##value: _##_#>)
    }
}
