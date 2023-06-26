//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/26.
//

import Foundation

let n = Int(readLine()!)!
var ground: [[Int]] = []
var visited: [[Bool]] = []

for _ in (0..<n) {
    let temp = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
    ground.append(temp)
}

let maxRain = ground.map({ $0.max()!}).max()!
var answer = 0

func bfs(i: Int, j: Int, h: Int) {
    let (dx, dy) = ([1, -1, 0, 0], [0, 0, 1, -1])
    var q = [(i, j)]
    visited[i][j] = true
    while !q.isEmpty {
        let (x, y) = q.removeFirst()
        for i in (0...3) {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                continue
            }
            if ground[nx][ny] > h && !visited[nx][ny] {
                q.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }
}

for h in (0...maxRain) {
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var temp = 0
    for i in (0..<n) {
        for j in (0..<n) {
            if !visited[i][j] && ground[i][j] > h {
                bfs(i: i, j: j, h: h)
                temp += 1
            }
        }
    }
    answer = max(answer, temp)
}

print(answer)
