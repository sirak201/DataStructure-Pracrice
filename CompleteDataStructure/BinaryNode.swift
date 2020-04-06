//
//  BinaryNode.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/28/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


class BinaryNode<Element : Comparable> {

    public var value : Element
    public var leftChild: BinaryNode?
    public var rightChild : BinaryNode?

    public init (value : Element) {
        self.value = value
    }

}


//MARK: - Treverse
extension BinaryNode {

    public func inOrderTraversal(vist : (Element) -> Void) {
        leftChild?.inOrderTraversal(vist: vist)
        vist(value)
        rightChild?.inOrderTraversal(vist: vist)
    }

    public func preOrderTraversal(vist : (Element) -> Void) {
        vist(value)
        leftChild?.preOrderTraversal(vist: vist)
        rightChild?.preOrderTraversal(vist: vist)
    }

    public func postOrderTraversal(vist : (Element) -> Void) {
        leftChild?.postOrderTraversal(vist: vist)
        rightChild?.postOrderTraversal(vist : vist)
        vist(value)

    }

}

////MARK: - Challange
extension BinaryNode {
    //---Question 1 Find Height Of Binary Tree

    /*

        Thought Process --
      Traverse Like Post Order
      Keeping going till leaf node -- Recursive
      Func returns higer height comparing left and right -- Base Case
    */

    func findHeight(node : BinaryNode) -> Int {
        var leftHeight = 1
        var rightHeight = 1


        if let leftNode = node.leftChild {
            leftHeight += findHeight(node: leftNode)
        }

        if let rightNode = node.rightChild {
            rightHeight += findHeight(node: rightNode)
        }

        return leftHeight > rightHeight ? leftHeight: rightHeight
    }



    //---Question 2 Setrilize Binary Tree

    /* Thought Process --
        // Treverse in a preorder fashion - Recusive
        // Have an Array the store values
        // Function returns an array
        // Append value
        // For each left and right append return array values
    */

    func serialization(node : BinaryNode)-> [Element?] {
        var holder = [Element?]()

        holder.append(node.value)

        if let leftNode = node.leftChild {
            let leftChildren = serialization(node: leftNode)

            holder.append(contentsOf : leftChildren)
        } else {
            holder.append(nil)
        }

        if let rightNode = node.rightChild {
            let right = serialization(node: rightNode)
            holder.append(contentsOf : right)
        } else {
            holder.append(nil)
        }



       return holder
    }




}
//
//
//
//
//
//
////MARK: - Print Extention
extension BinaryNode: CustomStringConvertible {

  public var description: String {
    diagram(for: self)
  }

  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
        return root + "nil\n"
    }

    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }

    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
         + root + "\(node.value)\n"
         + diagram(for: node.leftChild,
                   bottom + "│ ", bottom + "└──", bottom + " ")
  }
}




