//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/28.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let (n, m) = (nm[0], nm[1])
var visited = Array(repeating: false, count: n+1)
var seq: [Int] = []

func solution(k: Int) {
    if k == m {
        print(seq.map{ String($0) }.joined(separator: " "))
        return
    }
    
    for i in (1...n) {
        if !visited[i] {
            seq.append(i)
            visited[i] = true
            solution(k: k+1)
            visited[i] = false
            seq.removeLast()
        }
    }
}

solution(k: 0)
