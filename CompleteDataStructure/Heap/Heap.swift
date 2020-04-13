//
//  Heap.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/13/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


struct Heap<Element> {
    
    var elements : [Element] = []
    var sort : (Element , Element) -> Bool
    
    
    init(sort : @escaping (Element , Element) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    var peek : Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index : Int) -> Int {
        (2 * index ) + 1
    }
    
    func rightChildIndex(ofParentAt index : Int) -> Int {
           (2 * index ) + 2
    }
    
    func parentIndex(childAt index : Int) -> Int {
        (index - 1) / 2
    }
    
    
    
}
