//
//  Sorting.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/10/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


// Do a for loop
// Do another for loop inside it
// using the indexs check check if the left is bigger than the right if so do a swap

public func bubbleSorting<T>(_ collection : inout [T]) where T : MutableCollection , T.Element : Comparable {

    if collection.indices.count < 2 {
        return
    }

    for end in (1..<collection.indices.count).reversed() {

        var swapped = false
        var current = collection.startIndex

        while current < end {
            let next = collection.index(after: current)
            collection.swapAt(current, next)
            current = next
            swapped = true

        }

        if !swapped {
            return
        }
    }

    print(collection)

}






public func selectionSort<Element>(_ arr : inout [Element])  where Element : Comparable {

    if arr.count < 2 {
        return
    }

    for current in 0..<arr.count {

        var least = current
        for other in (current + 1)..<arr.count {
            if arr[least] > arr[other] {
                least = other
            }
        }

        if least != current {
            arr.swapAt(least, current)
        }


    }

    print(arr)

}















public func insertionSort<Element>(_ arr : inout [Element]) where Element : Comparable {
    
    if arr.count < 2 {
        return
    }
    
    for current in 1..<arr.count {
        
        for inner in (1...current).reversed() {
            
            if arr[inner] < arr[inner - 1] {
                arr.swapAt(inner, inner - 1)
            } else {
                break
            }
            
        }
    }
    print(arr)
}
