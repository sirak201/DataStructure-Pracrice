//
//  AVLNode.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/12/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


class AVLNode<Element : Comparable> {
    
    var val : Element
    var leftChild : AVLNode<Element>?
    var rightChild : AVLNode<Element>?
    public var height : Int  = 0
    
    public var balanceFactor : Int {
        return leftHeight - rightHeight
    }
    
    public var leftHeight : Int {
        return leftChild?.height ?? -1
    }
    
    public var rightHeight : Int {
        return rightChild?.height ?? -1
    }
    
    
    init(_ val : Element) {
        self.val = val
    }
    
    
    
    
}
