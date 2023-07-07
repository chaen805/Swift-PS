//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/07.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let (n, m) = (nm[0], nm[1])

var friend: [[Int]] = Array(repeating: [], count: n+1)
var check = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var kevin: [Int] = []

for _ in 0..<m {
    let temp = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    let (a, b) = (temp[0], temp[1])
    
    friend[a].append(b)
    friend[b].append(a)
}

for i in 1...n {
    bfs(i)
}
for i in 1...n {
    kevin.append(check[i].reduce(0, +))
}

print(kevin.firstIndex(of: kevin.min()!)! + 1)

func bfs(_ p: Int) {
    var visited = Array(repeating: false, count: n+1)
    visited[p] = true
    
    var q = [p]
    while !q.isEmpty {
        let x = q.removeFirst()
        for y in friend[x] {
            if !visited[y] {
                visited[y] = true
                q.append(y)
                check[p][y] = check[p][x] + 1
            }
        }
    }
}
