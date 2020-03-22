//
//  main.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

var linkedList = LinkedList<Int>()
linkedList.append(3)
linkedList.append(2)
linkedList.append(1)

print("Before inserting: \(linkedList)")
var middle = linkedList.node(at: 1)

middle = linkedList.insert(after: middle!, val: 10)

print("After inserting: \(linkedList)")

