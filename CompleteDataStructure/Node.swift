//
//  Node.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

public class Node<Value> {
    
    public var value : Value
    public var next : Node<Value>?
    
    public init( _ val : Value , _ next : Node<Value>?){
        self.value = val
        self.next = next
    }
    
}


extension Node: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}
