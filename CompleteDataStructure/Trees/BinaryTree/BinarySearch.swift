//
//  BinarySearch.swift
//  CompleteDataStructure
//
//  Created by Sirak Zeray on 4/12/20.
//  Copyright © 2020 Sirak Zeray. All rights reserved.
//

import Foundation


extension RandomAccessCollection where Element : Comparable {
    
    func binarySearch(for value : Element , in range : Range<Index>) -> Index?{
        
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound , to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middle] == value {
            return middle
        } else if self[middle] < value {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        } else {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        }

        
    }
    
    
}

/*
 “[1, 2, 3, 3, 3, 4, 5, 5]”

    find the value
 */


public func findIndices<Element : Comparable>(of : Element , in : [Element]) {
    
}

private func findLeft<Element : Comparable>(of : Element, arr : [Element] , range : Range<Int>) {
    
    
}
