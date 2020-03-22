//
//  LinkedList.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


public struct LinkedList<Value> {
    
    public var head : Node<Value>?
    public var tail : Node<Value>?
    
    public init() {}
    
    public var isEmpty : Bool {
        head == nil
    }
    
    public mutating func push(_ val : Value) {
        let newNode = Node(val, head)
        head = newNode
        
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ val : Value) {
        if tail != nil {
            tail!.next = Node(val, nil)
            tail = tail!.next
        } else {
            push(val)
        }
    }
    
    public func node(at index : Int) -> Node<Value>? {
        
        var currentHead = head
        var currentindex = 0
        
        while( currentindex < index && currentHead != nil) {
            currentHead = currentHead?.next
            currentindex += 1
        }
        
        return currentHead
    }
    
    @discardableResult
    public mutating func insert(after node : Node<Value> , val : Value) -> Node<Value> {
        
        guard tail !== node else {
            append(val)
            return tail!
        }
        
        node.next = Node(val, node.next)
        return node.next!
    }
    
    
    
    
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
