//
//  main.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

//var linkedList = LinkedList<Int>()
//linkedList.append(1)
//linkedList.append(2)
//linkedList.append(3)
//linkedList.push(0)
//linkedList.insert(at: 3, val: 4)
//linkedList.pop()
//linkedList.removeLast()
//
//
//print(linkedList)
//linkedList.printInReverse()
//print(linkedList.findMiddleIndex().value)
//print(linkedList.reverseLinkedList())

//
//var linkedList2 = LinkedList<Int>()
//linkedList2.append(5)
//linkedList2.append(6)
//linkedList2.append(7)
//
//print("Before inserting: \(linkedList)")
//var middle = linkedList.node(at: 1)
//
//middle = linkedList.insert(after: middle!, val: 10)
//
//print("After inserting: \(linkedList)")
////
//linkedList.remove(at: 2)
//print("After remove: \(linkedList)")
//
//linkedList.removeLast()
//print("After pop: \(linkedList)")
//
//
//
//let reverse = LinkedList<Int>.reverseLinkedList(node: linkedList.head)
//print("After reverse: \(reverse!)")
//
//let combine = LinkedList<Int>.mergeTwoList(node: linkedList, node: linkedList2)
//print("After Merge: \(combine)")
//
//
//
//// ------------- Tree ---------------
//
//var tree = TreeNode("Shoes")
//
//var casual = TreeNode("Casual")
//var sport = TreeNode("Sport")
//
//tree.add(casual)
//tree.add(sport)
//
//var steveMadden = TreeNode("Steve Madden")
//var ralph = TreeNode("Ralph")
//
//casual.add(steveMadden)
//casual.add(ralph)
//
//var nike = TreeNode("Nike")
//var puma = TreeNode("Puma")
//
//sport.add(nike)
//sport.add(puma)
//
//tree.forEachDepthFirst { (node) in
//    print(node.value)
//}
//
//tree.levelOrder { (node) in
//    print(node.value)
//}
//

// ------------- Tree ---------------

//var binaryTree: BinaryNode<Int> = {
//    let zero = BinaryNode(value: 0)
//    let one = BinaryNode(value: 1)
//    let five = BinaryNode(value: 5)
//    let seven = BinaryNode(value: 7)
//    let eight = BinaryNode(value: 8)
//    let nine = BinaryNode(value: 9)
//    let ten = BinaryNode(value: 10)
//
//
//    seven.leftChild = one
//    one.leftChild = zero
//    one.rightChild = five
//    seven.rightChild = nine
//    nine.leftChild = eight
//    eight.rightChild = ten
//
//    return seven
//}()



//print(binaryTree)
//print("InOrder Traversal ------")
//binaryTree.inOrderTravesal { element in
//    print(element)
//}




//
//let height = binaryTree.findHeight(node: binaryTree)
//print("Tree Height -- " ,  height)
//
//let serialization = binaryTree.serialization(node: binaryTree)
//print(serialization)



//---- BINARY SEARCH TREE



//var exampleTree: BinarySearchTree<Int> {
//  var bst = BinarySearchTree<Int>()
//  bst.insert(3)
//  bst.insert(1)
//  bst.insert(4)
//  bst.insert(0)
//  bst.insert(2)
//  bst.insert(5)
//  return bst
//}
//
//
//print(exampleTree.root)
//
//var head = exampleTree.root
//
//exampleTree.removeNode(&head, 3)
//print(head)



//---SORTING


var myArr = [4 , 9 , 10 , 3]
insertionSort(&myArr)
