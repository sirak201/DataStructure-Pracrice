//
//  LinkedList.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


public class LinkedList<Value : Comparable> {
    
    var head : Node<Value>?
    var tail : Node<Value>?
    
    
    /*
        Check if head is empty if so create a new node and set it to it as well as the tail
        if not , create a copy of head - loop until the next is nill then set next to new node
     */
    public func append(_ val : Value) {
        
        if head == nil {
            head = Node(val)
            tail = head
            return
        }
        
        var copy = head
        
        while let next = copy?.next {
            copy = next
        }
        
        copy?.next = Node(val)
        tail = copy?.next
        
    }
    
    /*
        check if head is nill if it is nill call append
        if not nill a temphead , create a new node make that head and make its next the temp copy
     */
    public func push(_ val : Value) {
        
        if head == nil {
            append(val)
            return
        }
        
        let temp = head
        let newHead = Node(val)
        newHead.next = temp
        head = newHead
    
    }
    
    
    /*
       create a counter loop until the counter matches index passes in if so return that node
     */
    
    public func node(at : Int) -> Node<Value>? {
        
        var counter = 0
        var temp = head
        
        while (counter < at && temp != nil) {
            temp = temp?.next
            counter += 1
        }
        return temp
    }
    
    @discardableResult
    public func insert(at : Int , val : Value) -> Bool {
        guard let insertingNode = node(at: at) else {
            return false
        }
        
        if insertingNode === tail {
            append(val)
            return true
        }
        
        let temp = insertingNode.next
        insertingNode.next = Node(val, temp)
        
        return true
    }
  
    
    @discardableResult
    public func pop() -> Node<Value>? {
        
        guard let head = head else {return nil}
        
        let temp = head
        self.head = temp.next
        
        return temp
    }
    
    /*
        loop until you find next.next is nil if so set the tail to that and set its next to nil
     */
    
    @discardableResult
    func removeLast() -> Node<Value>? {
        
        guard let _ = head?.next else {
            head = nil
            tail = nil
            return head
        }
        
        var temp = self.head
        while let _ = temp?.next?.next  {
            temp = temp?.next
        }
        
        let last = temp?.next
        temp?.next = nil
        tail = temp
        
        return last
    }
    
    /*
        make the function take node
        check if node is empty if so return
        recusive call that function using the next node
        print the cuurent node
     */
    
    private func printInReverse(_ node : Node<Value>?) {
        guard let node = node else {return}
        printInReverse(node.next)
        print(node.value)
    }
    
    public func printInReverse() {
        printInReverse(head)
    }
    
    
    /*
       have two node,
       while loop and one node moves one speed , the other node moves twice as fast
        
    */
    
    public func findMiddleIndex() -> Node<Value>{
        
        var slow = head
        var fast = head
        
        while(fast != nil) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow!
    }
    
    
     public func reverseLinkedList()-> LinkedList{
        
        let newList = LinkedList()
        
        newList.tail = head // Setting tail
        
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev  // Switch between current and prev
            prev = current
            current = next
        }
        
        newList.head = prev
        
        
        return newList
    }
    
    
    /*
        check if linkedList has more than elements if not check if has a next , if so compare and if they are equal
        while loop and check current and  equal do a loop and find till end and remove all node and reconnect
     */
    public func removeOccurrences(){
        
        guard let _ = head?.next else { return }
        guard let _ = head?.next?.next else {
            if head!.value == head?.next?.value {
                head = nil
                tail = nil
            }
            return
        }
        
        
        var temp = head
        
        while (temp != nil && temp?.next != nil){
            if temp?.value == temp?.next?.value {
                temp = temp?.next?.next
            }
            temp = temp?.next
        }

    }
    
    
    
    
    
}


















//
//public struct LinkedList<Value> {
//
//    public var head : Node<Value>?
//    public var tail : Node<Value>?
//
//    public init() {}
//
//    public var isEmpty : Bool {
//        head == nil
//    }
//
//    public mutating func push(_ val : Value) {
//        let newNode = Node(val, head)
//        head = newNode
//
//        if tail == nil {
//            tail = head
//        }
//    }
//
//    public mutating func append(_ val : Value) {
//        if tail != nil {
//            tail!.next = Node(val, nil)
//            tail = tail!.next
//        } else {
//            push(val)
//        }
//    }
//
//    public func node(at index : Int) -> Node<Value>? {
//
//        var currentHead = head
//        var currentindex = 0
//
//        while( currentindex < index && currentHead != nil) {
//            currentHead = currentHead?.next
//            currentindex += 1
//        }
//
//        return currentHead
//    }
//
//    @discardableResult
//    public mutating func insert(after node : Node<Value> , val : Value) -> Node<Value> {
//
//        guard tail !== node else {
//            append(val)
//            return tail!
//        }
//
//        node.next = Node(val, node.next)
//        return node.next!
//    }
//
//    @discardableResult
//    public mutating func remove(at index : Int) -> Value?{
//       var currentNode = head
//       var counter = 0
//       var value : Value? = nil
//
//        while currentNode != nil {
//            if counter + 1 == index {
//                value = currentNode?.next?.value
//                currentNode?.next = currentNode?.next?.next
//                return value
//            }
//            counter += 1
//            currentNode = currentNode?.next
//        }
//
//       return value
//    }
//
//    @discardableResult
//    public mutating func removeLast() ->Value? {
//       var lastnode = head
//       var counter = 0
//
//        while(lastnode?.next != nil) {
//            lastnode = lastnode?.next
//            counter += 1
//        }
//        remove(at: counter)
//        tail = lastnode
//
//        return lastnode?.value
//    }
//
//    @discardableResult
//    public mutating func pop() -> Value? {
//      defer {
//        head = head?.next
//        if isEmpty {
//          tail = nil
//        }
//      }
//      return head?.value
//    }
//
//}
//
extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
//
//
//extension LinkedList: Collection {
//
//
//    public struct Index : Comparable {
//
//        public var node : Node<Value>?
//
//        public static func == (lhs: Index, rhs: Index) -> Bool {
//
//            switch(lhs.node , rhs.node) {
//                case let (left?, right?):
//                    return left.next === right.next
//                case (nil , nil):
//                    return true
//                default:
//                    return false
//            }
//
//        }
//
//        public static func < (lhs: Index, rhs: Index) -> Bool {
//            guard lhs != rhs else {
//                return false
//            }
//
//            let nodes = sequence(first: lhs.node) {$0?.next}
//            return nodes.contains {$0 === rhs.node}
//        }
//
//    }
//
//    public var startIndex: Index {
//        Index(node: head)
//    }
//
//    public var endIndex: Index {
//        Index(node: tail?.next)
//    }
//
//    public func index(after i: Index) -> Index {
//        Index(node: i.node?.next)
//    }
//
//    public subscript(position: Index) -> Value {
//        position.node!.value
//    }
//
//}
//
//extension LinkedList {
//
//
//   static func printInReverse(node : Node<Value>?) {
//
//        guard  let node = node  else {return}
//        printInReverse(node: node.next)
//        print(node.value)
//
//    }
//
//    static func reverseLinkedList(node : Node<Value>?) -> Node<Value>?{
//
//        guard let _ = node?.next else {
//
//            let newNode : Node<Value> = Node(node!.value, nil)
//            return newNode
//
//        }
//
//        let reverseList = reverseLinkedList(node: node?.next)
//        var copy = reverseList
//
//        while copy != nil {
//            if copy?.next != nil {
//                copy = copy!.next
//            } else {
//                 copy?.next = Node(node!.value, nil)
//                 return reverseList
//            }
//
//        }
//
//        return reverseList
//
//    }
//
//    static func mergeTwoList(node first: LinkedList<Int> , node second :LinkedList<Int>) ->LinkedList<Int>{
//
//
//        var copyFirst = first.head
//        var copySecond = second.head
//
//        var newNode =  LinkedList<Int>()
//
//
//
//        while(copyFirst != nil && copySecond != nil) {
//            if copyFirst!.value > copySecond!.value {
//                newNode.append(copySecond!.value)
//                copySecond = copySecond?.next
//            } else {
//                newNode.append(copyFirst!.value)
//                copyFirst = copyFirst?.next
//            }
//        }
//
//        while (copyFirst != nil) {
//            newNode.append(copyFirst!.value)
//            copyFirst = copyFirst?.next
//        }
//
//        while (copySecond != nil) {
//            newNode.append(copySecond!.value)
//            copySecond = copySecond?.next
//        }
//
//
//        return newNode
//    }
//
//
//
//}
