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
    
    public func removeNode(_ element : Element)  {
        

    }
    
    private func removeNode(_ tree : BinaryNode<Element>? , _ element : Element) -> BinaryNode<Element>?{
        
        guard let tree = tree else {return nil}
        
        
        if tree.value == element {
            
            if tree.leftChild == nil && tree.rightChild == nil {
                return nil
            }
            
            if tree.leftChild == nil {
                return tree.rightChild
            }
            
            if tree.rightChild == nil {
                return tree.leftChild
            }
            
            tree.value = tree.rightChild!.min.value
            tree.rightChild = removeNode(tree.rightChild, tree.rightChild!.min.value)
        } else if tree.value < element {
            tree.leftChild = removeNode(tree.leftChild, element)
        } else {
            tree.rightChild = removeNode(tree.rightChild, element)
        }
        
        
        return tree
    }
    
    

    
    
    
}




extension BinarySearchTree: CustomStringConvertible {

  public var description: String {
    guard let root = root else { return "empty tree" }
    return String(describing: root)
  }
}
