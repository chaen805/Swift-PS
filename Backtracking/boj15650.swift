//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/28.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let (n, m) = (nm[0], nm[1])
var seq = [Int]()

func solution(_ k: Int) {
    if seq.count == m {
        print(seq.map{ String($0) }.joined(separator: " "))
        return
    }
    for i in (k..<n+1) {
        seq.append(i)
        solution(i+1)
        seq.removeLast()
    }
}

solution(1)
