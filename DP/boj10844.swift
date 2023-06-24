//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/24.
//

import Foundation

let n = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: 10), count: n+1)
dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

if n > 1 {
    for i in (2...n) {
        dp[i][0] = dp[i-1][1] % 1000000000
        dp[i][9] = dp[i-1][8] % 1000000000
        for j in (1...8) {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
        }
    }
}

print(dp[n].reduce(0, +) % 1000000000)
