//
//  NSColor.swift
//  macOSIncubator
//
//  Created by Tom Biel on 11/4/19.
//  Copyright © 2019 Tom Biel. All rights reserved.
//

#if os(macOS)
import Cocoa

extension NSColor {
    
    @available(OSX 10.15, *)
    public static let SystemColors = [NSColor.systemIndigo, NSColor.systemTeal, NSColor.systemGreen, NSColor.systemRed, NSColor.systemPink, NSColor.systemBlue, NSColor.systemOrange, NSColor.systemYellow, NSColor.systemGray]
    
    @available(OSX 10.15, *)
    @inlinable
    public static func randomSystemColor() -> NSColor {
        //return NSColor.SystemColors[Int.random(in: 0..<NSColor.SystemColors.count)]
        return NSColor.SystemColors.randomElement()!
        
    }
}
#endif
