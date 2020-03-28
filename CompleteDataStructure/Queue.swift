//
//  Queue.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/24/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

public protocol Queue {
    // FIFO -  First in the first out
    associatedtype Element
    mutating func enqueue(_ element : Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty : Bool { get }
    var peek : Element? { get }
    
}

public struct QueueArray<T> : Queue {


    
    public typealias Element = T
    
    private var array : [T] = []
    
    public init () {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        
        return isEmpty ? nil : array.removeFirst()
        
    }
}



public struct QueueStack<T> : Queue {
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
   
    
    public typealias Element = T
    
    private var leftStack : [T] = []
    private var rightStack : [T] = []
}


extension QueueArray: CustomStringConvertible {
  public var description: String {
    String(describing: array)
  }
}







