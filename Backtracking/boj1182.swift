//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/16.
//

import Foundation

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, s) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

var sub: [Int] = []
var count = 0

func solution(k: Int) {
    if sub.reduce(0, +) == s && sub.count > 0 {
        count += 1
    }
    
    for i in (k..<n) {
        sub.append(arr[i])
        solution(k: i+1)
        sub.popLast()
    }
}

solution(k: 0)
print(count)
