//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/22.
//

import Foundation

let t = Int(readLine()!)!
var input: [Int] = []
var graph: [[Int]] = []

for _ in (0..<t) {
    input = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
    let n = input[1]; let m = input[0]; let k = input[2];
    graph = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for _ in (0..<k) {
        let temp = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
        graph[temp[1]][temp[0]] = 1
    }
    
    var answer = 0
    for i in (0..<n) {
        for j in (0..<m) {
            if graph[i][j] == 1 {
                bfs(i: i, j: j)
                answer += 1
            }
        }
    }
    print(answer)
}

func bfs(i: Int, j: Int) {
    let (dx, dy) = ([1, -1, 0, 0], [0, 0, 1, -1])
    
    var q = [(i, j)]
    graph[i][j] = 0
    
    while !q.isEmpty {
        let (x, y) = q.removeFirst()
        for k in (0...3) {
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if (0 <= nx && nx < input[1]) && (0 <= ny && ny < input[0]) && graph[nx][ny] == 1 {
                q.append((nx, ny))
                graph[nx][ny] = 0
            }
        }
    }
}
