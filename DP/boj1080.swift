//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/23.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
let (n,m) = (nm[0], nm[1])

var A: [[Int]] = []
var B: [[Int]] = []

var answer = 0

for _ in (0..<n) {
    A.append(Array(readLine()!).map{ Int(String($0))! })
}
for _ in (0..<n) {
    B.append(Array(readLine()!).map{ Int(String($0))! })
}

func flip(x: Int, y: Int) {
    for i in (x..<x+3) {
        for j in (y..<y+3) {
            A[i][j] = 1 - A[i][j]
        }
    }
}

if n < 3 || m < 3 {
    if A == B {
        print(answer)
    } else {
        print(-1)
    }
} else {
    for i in (0...n-3) {
        for j in (0...m-3) {
            if A[i][j] != B[i][j] {
                flip(x: i, y: j)
                answer += 1
            }
        }
    }
    if A == B {
        print(answer)
    } else {
        print(-1)
    }
}
