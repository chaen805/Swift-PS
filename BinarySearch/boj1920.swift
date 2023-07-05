//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/05.
//

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").compactMap{ Int(String($0)) }
let m = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ").compactMap{ Int(String($0)) }

arr.sort()
for i in nums {
    if binarySearch(array: arr, item: i) {
        print(1)
    } else {
        print(0)
    }
}

func binarySearch<T: Comparable>(array: [T], item: T) -> Bool {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == item { return true }
        
        if array[mid] > item {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return false
}
