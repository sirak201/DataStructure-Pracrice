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
    
    @discardableResult
    public mutating func remove(at index : Int) -> Value?{
       var currentNode = head
       var counter = 0
       var value : Value? = nil
        
        while currentNode != nil {
            if counter + 1 == index {
                value = currentNode?.next?.value
                currentNode?.next = currentNode?.next?.next
                return value
            }
            counter += 1
            currentNode = currentNode?.next
        }
       
       return value
    }
    
    @discardableResult
    public mutating func removeLast() ->Value? {
       var lastnode = head
       var counter = 0
        
        while(lastnode?.next != nil) {
            lastnode = lastnode?.next
            counter += 1
        }
        remove(at: counter)
        tail = lastnode
       
        return lastnode?.value
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
      defer {
        head = head?.next
        if isEmpty {
          tail = nil
        }
      }
      return head?.value
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


extension LinkedList: Collection {
    
    
    public struct Index : Comparable {
        
        public var node : Node<Value>?
           
        public static func == (lhs: Index, rhs: Index) -> Bool {
            
            switch(lhs.node , rhs.node) {
                case let (left?, right?):
                    return left.next === right.next
                case (nil , nil):
                    return true
                default:
                    return false
            }
           
        }

        public static func < (lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) {$0?.next}
            return nodes.contains {$0 === rhs.node}
        }
  
    }
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
    
}

extension LinkedList {
    

   static func printInReverse(node : Node<Value>?) {
        
        guard  let node = node  else {return}
        printInReverse(node: node.next)
        print(node.value)

    }
    
    static func reverseLinkedList(node : Node<Value>?) -> Node<Value>?{
        
        guard let _ = node?.next else {
            
            let newNode : Node<Value> = Node(node!.value, nil)
            return newNode
            
        }
        
        let reverseList = reverseLinkedList(node: node?.next)
        var copy = reverseList
        
        while copy != nil {
            if copy?.next != nil {
                copy = copy!.next
            } else {
                 copy?.next = Node(node!.value, nil)
                 return reverseList
            }
            
        }
 
        return reverseList
        
    }
    
    static func mergeTwoList(node first: LinkedList<Int> , node second :LinkedList<Int>) ->LinkedList<Int>{
        
        
        var copyFirst = first.head
        var copySecond = second.head
        
        var newNode =  LinkedList<Int>()
        
        
        
        while(copyFirst != nil && copySecond != nil) {
            if copyFirst!.value > copySecond!.value {
                newNode.append(copySecond!.value)
                copySecond = copySecond?.next
            } else {
                newNode.append(copyFirst!.value)
                copyFirst = copyFirst?.next
            }
        }
        
        while (copyFirst != nil) {
            newNode.append(copyFirst!.value)
            copyFirst = copyFirst?.next
        }
        
        while (copySecond != nil) {
            newNode.append(copySecond!.value)
            copySecond = copySecond?.next
        }
        
        
        return newNode
    }
    
    
    
}
