//
//  PriorityQueue.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/19/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


struct PriorityQueue<Element : Comparable> : Queue {

    var heap : Heap<Element>
    
    init(sort : @escaping (Element , Element) -> Bool , elements : [Element]) {
        self.heap = Heap(sort: sort, elements: elements)
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
       return heap.remove()
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: Element? {
        heap.peek
    }
    
}
