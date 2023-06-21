//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/21.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)

for _ in (0..<m) {
    let temp = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
    graph[temp[0]].append(temp[1])
    graph[temp[1]].append(temp[0])
}

func bfs() -> Int {
    var q = [1]
    visited[1] = true
    var count = 0
    
    while !q.isEmpty {
        let n = q.removeFirst()
        for i in graph[n] {
            if !visited[i] {
                q.append(i)
                visited[i] = true
                count += 1
            }
        }
    }
    return count
}

print(bfs())
