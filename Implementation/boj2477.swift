//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/09.
//

import Foundation

let k = Int(readLine()!)!

var melonMap: [[Int]] = []
var maxWidth = 0
var maxHeight = 0
var maxWidthIdx = 0
var maxHeightIdx = 0
var delArea = 0

for i in 0..<6 {
    let temp = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    let (d, l) = (temp[0], temp[1])
    
    if d == 2 || d == 1 {
        if l > maxWidth {
            maxWidth = l
            maxWidthIdx = i
        }
    } else if d == 3 || d == 4 {
        if l > maxHeight {
            maxHeight = l
            maxHeightIdx = i
        }
    }
    
    melonMap.append([d, l])
}

delArea = melonMap[(maxHeightIdx + 3) % 6][1] * melonMap[(maxWidthIdx + 3) % 6][1]

print((maxWidth * maxHeight - delArea) * k)
