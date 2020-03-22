//
//  RandomAlgo.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 3/21/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation

func printSorted(_ arr : [Int]) {     // Time Complex O(n * 3 )
                                      // Space Complex O(n)
    var copy = arr
    
    for i in 0..<copy.count {
        for j in 0..<copy.count {
            if copy[j] > copy[i] {
                let holder = copy[i]
                copy[i] = copy[j]
                copy[j] = holder
            }
        }
    }
    
    copy.forEach { item in
        print(item)
    }
    
}

func printSortedSecond(_ arr  : [Int]) {    // Time Complex  2 O(n)
                                            // Space Comlex O(1)
    
    var min = Int.max
    
    for i in arr {
        if i < min {
            min = i
        }
    }
    
    print(min)
    
    var secondMin = Int.max
    var counrer = 0

    while (counrer < arr.count) {
        
        for i in arr {
            if i < secondMin && i > min {
                secondMin = i
            }
        }
        min = secondMin
        print(min)
        secondMin = Int.max
        counrer += 1
    }
    
    
}
