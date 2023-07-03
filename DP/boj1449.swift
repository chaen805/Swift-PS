//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/02.
//
import Foundation

let nl = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let (n, l) = (nl[0], nl[1])
var leak = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
var fix = Array(repeating: false, count: 2001)
var answer = 0

leak.sort()

for i in leak {
    if !fix[i] {
        answer += 1
        for j in i..<i+l {
            fix[j] = true
        }
    }
}

print(answer)
