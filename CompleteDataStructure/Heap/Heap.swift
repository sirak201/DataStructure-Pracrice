//
//  Heap.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/13/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


struct Heap<Element : Comparable> {

    var elements : [Element] = [Element]()
    var sort : (Element , Element) -> Bool
    
    init(sort : @escaping (Element , Element) -> Bool , elements : [Element]) {
        
        self.sort = sort
        
        if !elements.isEmpty {
            for i in stride(from: (elements.count / 2) - 1, to: 0, by: -1) {
                shiftDown(at: i)
            }
        }
     
        
        
    }
    
    
    
    var isEmpty : Bool {
         elements.isEmpty
    }
    
    var peek : Element? {
         elements.first
    }
    
    public func leftChildIndex(ofParentAt index : Int) -> Int{
         (2 * index) + 1
    }
    
    public func rightChildIndex(ofParentAt index : Int) -> Int{
         (2 * index) + 2
    }
    
    public func parentIndexOf(childAt index : Int) -> Int {
      (index - 1) / 2
    }
    
    public mutating func remove() -> Element? {
        
        elements.swapAt(0, elements.count - 1)
        shiftDown(at: 0)
        
        return elements.removeLast()
    }
    
    public mutating func insert(_ element : Element) {
        
        elements.append(element)
        shiftUp(at: elements.count - 1)
        
    }
    
    public mutating func remove(at index : Int) -> Element? {
        
        guard index >= elements.count else {
            return nil
        }
        
        elements.swapAt(index, elements.count - 1)
        defer {
            shiftDown(at: index)
            shiftUp(at: index)
        }
        
        return index < elements.count - 1 ?  elements.remove(at: index) : nil
    }
    
  
    private mutating func shiftUp(at : Int) {
        
        var child = at
        
        while parentIndexOf(childAt: child) > 0 {
            var current = child
            let parent = parentIndexOf(childAt: child)
            
            if sort(elements[parent] , elements[child]){
                current = parent
            }
            
            if current == child {
                return
            }
            
            elements.swapAt(child, current)
            child = current
        }

    }

    private mutating func shiftDown(at : Int) {
        
        var parent = at
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var current = parent
            
            
            if left < elements.count && sort(elements[left] , elements[current]) {
                current = left
            }
            
            if right < elements.count && sort(elements[right] , elements[current]) {
                current = right
            }
            
            if parent == current {
                return
            }
            
            elements.swapAt(current, parent)
            parent = current
        }
            
    }
    
    public func index(of element : Element , starttingAt i  : Int) -> Int?{
        
        if i >= elements.count {
            return nil
        }
        
        if sort(element , elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }
        
        if let left = index(of: element, starttingAt: leftChildIndex(ofParentAt: i)) {
            return left
        }
        
        if let right = index(of: element, starttingAt: rightChildIndex(ofParentAt: i)) {
            return right
        }

        
        return nil
    }
    
    
    
}
