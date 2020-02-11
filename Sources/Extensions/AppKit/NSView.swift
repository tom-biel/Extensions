//
//  File.swift
//  
//
//  Created by Tom Biel on 11/11/19.
//

#if os(macOS)

import AppKit

extension NSView {
    
//    public static var nibName: String? {
//        return String(describing: Self.self)
//    }
    
    /// Loads new view from nib where owner is self
    ///
    ///  Nib file should have the same name as the View this method is called on
    ///
    /// - Parameter bundle: Bundle to use, leave out this parameter to load from main bundle
    @inlinable
    public static func createFromNib(in bundle: Bundle = Bundle.main) -> Self? {
        createFromNib(owner: self, in: bundle)
    }
    
    /// Loads new view from nib
    ///
    /// #imageLiteral(resourceName: "Screen Shot 2019-12-11 at 7.27.44 AM.png") Nib file should have the same name as the View this method is called on
    ///
    /// - Parameter bundle: Bundle to use, leave out this parameter to load from main bundle
    @inlinable
    public static func createFromNib(owner: Any?, in bundle: Bundle = Bundle.main) -> Self? {
        //guard let nibName = self.nibName else { return nil }
        return createFromNibNamed(nibName: String(describing: Self.self), owner: owner, in: bundle)
    }
    
    public static func createFromNibNamed(nibName: NSNib.Name, owner: Any?, in bundle: Bundle = Bundle.main) -> Self? {

        //guard let nibName = nibName else { return nil }
        var topLevelArray: NSArray? = nil
        bundle.loadNibNamed(NSNib.Name(nibName), owner: self, topLevelObjects: &topLevelArray)
        guard let results = topLevelArray else { return nil }
        let views = Array<Any>(results).filter { $0 is Self }
        return views.last as? Self
        
        /*
        var objects: NSArray? = nil
        if(bundle.loadNibNamed(NSNib.Name(nibName), owner: owner, topLevelObjects: &objects)) {
            if let objects = objects {
                for item in objects {
                    if(item is Self) {
                        return item as? Self
                    }
                }
            }
        }
        
        return nil*/
    }
}

#endif
