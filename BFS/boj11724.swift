//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/01.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let (n, m) = (nm[0], nm[1])

var graph: [[Int]] = Array(repeating: [], count: n+1)
var not_visited = Array(1...n)
var answer = 0

for _ in 0..<m {
    let temp = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    let(u, v) = (temp[0], temp[1])
    graph[u].append(v)
    graph[v].append(u)
}

func bfs(_ start: Int) {
    var q = [start]

    while !q.isEmpty {
        let n = q.removeFirst()
        for i in graph[n] {
            if not_visited.contains(i) {
                q.append(i)
                not_visited.removeAll(where: { $0 == i })
            }
        }
    }
}

while !not_visited.isEmpty {
    let i = not_visited.removeFirst()
    bfs(i)
    answer += 1
}

print(answer)
