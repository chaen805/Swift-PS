//
//  main.swift
//  0711
//
//  Created by Chaeeun Shin on 2023/07/11.
//

import Foundation

let n = Int(readLine()!)!
var house: [[Int]] = []

for _ in 0..<n {
    let temp = readLine()!.compactMap{ Int(String($0)) }
    house.append(temp)
}

var count: [Int] = []

for i in 0..<n {
    for j in 0..<n {
        if house[i][j] == 1 {
            bfs(i, j)
        }
    }
}

print(count.count)
for i in count.sorted() {
    print(i)
}

func bfs(_ i: Int, _ j: Int) {
    let (dx, dy) = ([1, -1, 0, 0], [0, 0, 1, -1])
    var q = [(i, j)]
    var cnt = 1
    house[i][j] = 0
    
    while !q.isEmpty {
        let (x, y) = q.removeFirst()
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if (0 <= nx && nx < n) && (0 <= ny && ny < n) && house[nx][ny] == 1 {
                q.append((nx, ny))
                house[nx][ny] = 0
                cnt += 1
            }
        }
    }
    
    count.append(cnt)
}

