//
//  File.swift
//  
//
//  Created by Tom Biel on 11/9/19.
//


extension Array where Element: Equatable {

    @discardableResult
    public mutating func remove(object: Element) -> Bool {
        if let index = firstIndex(of: object) {
            self.remove(at: index)
            return true
        }
        return false
    }

    @discardableResult
    public mutating func remove(where predicate: (Array.Iterator.Element) -> Bool) -> Bool {
        if let index = self.firstIndex(where: { (element) -> Bool in
            return predicate(element)
        }) {
            self.remove(at: index)
            return true
        }
        return false
    }
    
    @discardableResult
    public mutating func removeAll(_ item: Element) -> Array {
        removeAll(where: { item == $0 })
        return self
    }
}
