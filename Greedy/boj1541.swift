//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/25.
//

import Foundation

let exp = readLine()!.components(separatedBy: "-")
var nums: [Int] = []

for e in exp {
    let temp = e.components(separatedBy: "+").compactMap{Int($0)}.reduce(0, +)
    nums.append(temp)
}

var answer = nums[0] + nums.reduce(nums[0], -)
print(answer)
