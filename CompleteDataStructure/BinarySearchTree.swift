//
//  BinaryTree.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/5/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation



struct BinarySearchTree<Element : Comparable> {
    var root : BinaryNode<Element>?
    
    
    
    private func  insert(_ head : BinaryNode<Element>? , _ val : Element) -> BinaryNode<Element> {
        // Check if root is empty add to root if so - Base Case
        /*
            if not compare if root  - Recusion
            recursive call to left if less and recsivly call if bigger or equal tp
            then return root
         
        */
        
        guard let head = head else {
            return BinaryNode(value: val)
    
        }
        
        
        if head.value > val {
             head.leftChild = insert(head.leftChild, val)
        } else {
             head.rightChild = insert(head.rightChild, val)
        }
        
        return head
    }
    
    public mutating func insert(_ val : Element) {
        root = insert(root, val)
    }
    
    public func contains(_ val : Element) -> Bool {
        
        var head = root
        
        while (head != nil) {
            if head?.value == val {
                return true
            }
            
            if head!.value > val {
                head = head?.leftChild
            } else {
                head = head?.rightChild
            }
        }
        
        return false
    }
    
    public func removeNode(_ head : inout BinaryNode<Element>? , _ val : Element)  {
        
        // If it has no kids
        if head?.value == val {
            if head?.leftChild == nil && head?.rightChild == nil {
                head = nil
                return
            }
         
            // If it has only one kids
            if head?.leftChild == nil && head?.rightChild != nil || head?.leftChild != nil && head?.rightChild == nil {
                guard let left = head?.leftChild else {
                  head = head?.rightChild
                  return
                }
                head = left
                
                return
            }
                
            var copy = head?.rightChild
                
            while let nextLeft = copy?.leftChild{
                copy = nextLeft
            }
                
            head?.value = copy!.value
            
            
            return
            
      
    }
        
        
        while head != nil {
            if head!.value > val {
                var left = head?.leftChild
                removeNode(&left, val)
                head?.leftChild = left
                return
            } else {
                var right = head?.rightChild
                removeNode(&right, val)
                head?.rightChild = right
                return
            }
            
        }
        
        
    }
    
    

    
    
    
}




extension BinarySearchTree: CustomStringConvertible {

  public var description: String {
    guard let root = root else { return "empty tree" }
    return String(describing: root)
  }
}
