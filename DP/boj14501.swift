//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/29.
//

import Foundation

let n = Int(readLine()!)!
var work: [[Int]] = []
var dp = Array(repeating: 0, count: n+1)
var answer = 0

for _ in (1...n) {
    let temp = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    work.append(temp)
}

for i in stride(from: n-1, to: -1, by: -1) {
    if work[i][0] + i <= n {
        dp[i] = max(work[i][1] + dp[work[i][0] + i], answer)
        answer = dp[i]
    } else {
        dp[i] = answer
    }
}

print(answer)
