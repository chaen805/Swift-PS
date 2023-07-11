//
//  main.swift
//  0711
//
//  Created by Chaeeun Shin on 2023/07/11.
//

import Foundation

let floors = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
let (f, s, g, u, d) = (floors[0], floors[1], floors[2], floors[3], floors[4])
let MAX = 1000001

var visited = Array(repeating: false, count: MAX)
var count = Array(repeating: 0, count: MAX)

// bfs
let dh = [u, -d]
var q = [s]
visited[s] = true

while !q.isEmpty {
    let n = q.removeFirst()
    for i in 0...1 {
        let nn = n + dh[i]
        if (0 < nn && nn <= f) && !visited[nn] {
            visited[nn] = true
            q.append(nn)
            count[nn] = count[n] + 1
        }
    }
}

if visited[g] {
    print(count[g])
} else {
    print("use the stairs")
}


