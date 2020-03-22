//
//  Stack.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

public struct Stack<V>  {
    typealias stackType = V
    private var storage : [stackType ] = []
    
    mutating func push(_ item : stackType) {
        storage.append(item)
    }
    
    @discardableResult
    mutating func pop() -> stackType?{
        return isEmpty() ? nil : storage.popLast()
    }
    
    @discardableResult
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
    
    @discardableResult
    func peek() -> stackType? {
        return isEmpty() ? nil : storage[0]
    }
    
    public init () {}
    
    public init (_ arr : [V]) {
        storage = arr
    }
    
}


extension Stack: CustomStringConvertible {

  public var description: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
  }
}

extension Array {
    // Printing a array in reverse using a stack
    func printInReverse() {
        var stack = Stack(self)
        while (!stack.isEmpty()) {
            print(stack.pop()!)
        }
    }
}

extension String {
    
    func checkParentheses(_ str : String) -> Bool{
        
        var stack : Stack<Character> = Stack()
        
        for i in str {
            if i == "(" {
                stack.push(i)
            } else if  i == ")" {
                if stack.pop() == nil {
                    stack.push("(")
                }
            }
        }
        
        return stack.isEmpty()
    }
    
}
