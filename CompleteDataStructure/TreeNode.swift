//
//  TreeNode.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/28/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


public class TreeNode<T> {
    
    public var value : T    // Tree Node Value
    public var children : [TreeNode] = [] // Tree Node children
    
    init(_ val : T) {
        self.value = val
    }
    
    public func add(_ child : TreeNode) {
        children.append(child)
    }
    
}


//MARK: - Exploring Node Children

extension TreeNode {
    /// Prints Parent First then next child to its leaf level and next child etc and
    func printdepthFirstSearch(treeNode : TreeNode) {
        print(treeNode.value)
        treeNode.children.forEach {
            $0.printdepthFirstSearch(treeNode: $0)
        }
    }
    
    /// Clouser function that explores wit DFS and returns the node for further use
    public func forEachDepthFirst(visit : (TreeNode) -> Void) {
        visit(self)
        self.children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    /// Level Order  explorers TreeNode by each level
    public func levelOrder(visit : (TreeNode) -> Void) {
        var queue = QueueArray<TreeNode>()
        queue.enqueue(self)
        var children = [TreeNode]()
        
        while (!queue.isEmpty) {
            while let dequed = queue.dequeue() {
                visit(dequed)
                dequed.children.forEach {
                    children.append($0)
                }
        }
            
            children.forEach {
                queue.enqueue($0)
            }
            print()
            children = []
        }
    }

}

extension TreeNode where T: Equatable {
  public func search(_ value: T) -> TreeNode? {
    var result: TreeNode?
    forEachDepthFirst{ node in
      if node.value == value {
        result = node
      }
    }
    return result
  }
}
