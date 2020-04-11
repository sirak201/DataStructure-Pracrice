//
//  DoubleLinkedList.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/8/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

struct DoubleLinkedList<Value : Comparable>  {
    
    var head : DoubleNode<Value>?
    var tail : DoubleNode<Value>?
    
    public mutating func append(_ val : Value) {
        let newNode = DoubleNode(val)

        if head == nil {
            head = newNode
            tail = head
            return
        }
        
        tail?.next = newNode
        newNode.prev = self.tail
        tail = newNode

    }
    
    public mutating func push(_ val : Value) {
        
        if head == nil {
            append(val)
        }
        
        let newNode = DoubleNode(val, head, nil)
        head?.prev = newNode
        head = newNode
    }
    
    
    public mutating func pop() -> DoubleNode<Value>? {
        let popped = head
        head = head?.next
        
        return popped
    }
    
    
    public func findMiddleIndex()-> DoubleNode<Value>?{
        
        var current = head
        var offSetter = tail
        
        
        while offSetter != nil {
            current = current?.next
            offSetter = offSetter?.prev?.prev
        }
        
        return current
    }
    
    
}


struct ListQueue<Value : Comparable>: Queue {
    
    var doubleList = DoubleLinkedList<Value>()
    
    mutating func enqueue(_ element: Value) -> Bool {
        doubleList.append(element)
        return true
    }
    
    mutating func dequeue() -> Value? {
        return doubleList.pop()?.value
    }
    
    var isEmpty: Bool {
        return doubleList.head == nil
    }
    
    var peek: Value? {
        return doubleList.head?.value
    }
    
    typealias Element = Value
    
    
}
