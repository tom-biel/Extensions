//
//  File.swift
//  
//
//  Created by Tom Biel on 11/10/19.
//


#if os(macOS)

import AppKit

extension NSViewController {
 
    @objc public static var storyboardName: String? {
        return NSStoryboard.Name(String(describing: Self.self))
    }
    
    public static func createFromStoryboard(bundle: Bundle? = nil) -> Self? {
            
        guard let storyboardName = storyboardName else { return nil }
               
        let storyboard = NSStoryboard(name: storyboardName, bundle: bundle)

        guard let viewcontroller = storyboard.instantiateInitialController() as? Self else {
            fatalError("NSViewController.storyboardName instantiateInitialController didn't load")
        }

        return viewcontroller
    }
    
    // MARK: Storyboard instantiation
    public static func createFromStoryboard(withIdentifier storyboardIdentifier: NSStoryboard.SceneIdentifier, bundle: Bundle = Bundle.main) -> Self? {
         
        guard let storyboardName = storyboardName else { return nil }
        
         let storyboard = NSStoryboard(name: storyboardName, bundle: bundle)
        
         guard let viewcontroller = storyboard.instantiateController(withIdentifier: storyboardIdentifier) as? Self else {
             fatalError("Why cant i find MainViewController? - Check Main.storyboard")
         }

         return viewcontroller
     }
    
    public static func instantiate(fromStorybooardName storyboardName:NSStoryboard.Name,
                                   withIdentifier: NSStoryboard.SceneIdentifier,
                                   bundle: Bundle = Bundle.main) -> Self {
        
        let storyboard = NSStoryboard(name: storyboardName, bundle: bundle)
        
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: withIdentifier) as? Self else {
            fatalError("Why cant i find MainViewController? - Check Main.storyboard")
        }

        return viewcontroller
    }
}

extension NSViewController {
    
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
    ///  Nib file should have the same name as the View this method is called on
    ///
    /// - Parameter bundle: Bundle to use, leave out this parameter to load from main bundle
    @inlinable
    public static func createFromNib(owner: Any?, in bundle: Bundle = Bundle.main) -> Self? {
        //guard let nibName = self.nibName else { return nil }
        return createFromNibNamed(nibName: String(describing: Self.self), owner: owner, in: bundle)
    }
    
    public static func createFromNibNamed(nibName: NSNib.Name, owner: Any?, in bundle: Bundle = Bundle.main) -> Self? {

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
        
        return nil
    }
}
#endif
