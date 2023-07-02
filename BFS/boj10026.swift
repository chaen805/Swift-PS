//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/07/01.
//

import Foundation

let n = Int(readLine()!)!
var paint: [[String]] = []

for _ in 0..<n {
    let temp = readLine()!.map{ String($0) }
    paint.append(temp)
}

// 1 - 색약, 2 - 일반
var count1 = 0
var count2 = 0

var visited1 = Array(repeating: Array(repeating: false, count: n), count: n)
var visited2 = Array(repeating: Array(repeating: false, count: n), count: n)

let (dx, dy) = ([1, -1, 0, 0], [0, 0, 1, -1])

func bfs1(_ i: Int, _ j: Int, _ c: String) {
    var q = [(i, j)]
    visited1[i][j] = true

    if c == "B" {
        while !q.isEmpty {
            let (x, y) = q.removeFirst()
            
            for k in 0...3 {
                let (nx, ny) = (x + dx[k], y + dy[k])
                if nx >= n || nx < 0 || ny >= n || ny < 0 {
                    continue
                }
                if paint[nx][ny] == "B" && !visited1[nx][ny] {
                    q.append((nx, ny))
                    visited1[nx][ny] = true
                }
                
            }
        }
    } else {
        while !q.isEmpty {
            let (x, y) = q.removeFirst()
            
            for k in 0...3 {
                let (nx, ny) = (x + dx[k], y + dy[k])
                if nx >= n || nx < 0 || ny >= n || ny < 0 {
                    continue
                }
                if (paint[nx][ny] == "G" || paint[nx][ny] == "R") && !visited1[nx][ny] {
                    q.append((nx, ny))
                    visited1[nx][ny] = true
                }
            }
        }
    }
}

func bfs2(_ i: Int, _ j: Int, _ c: String) {
    var q = [(i, j)]
    visited2[i][j] = true
    
    if c == "B" {
        while !q.isEmpty {
            let (x, y) = q.removeFirst()
            
            for k in 0...3 {
                let (nx, ny) = (x + dx[k], y + dy[k])
                if nx >= n || nx < 0 || ny >= n || ny < 0 {
                    continue
                }
                if paint[nx][ny] == "B" && !visited2[nx][ny] {
                    q.append((nx, ny))
                    visited2[nx][ny] = true
                }
                
            }
        }
    } else if c == "G" {
        while !q.isEmpty {
            let (x, y) = q.removeFirst()
            
            for k in 0...3 {
                let (nx, ny) = (x + dx[k], y + dy[k])
                if nx >= n || nx < 0 || ny >= n || ny < 0 {
                    continue
                }
                if paint[nx][ny] == "G" && !visited2[nx][ny] {
                    q.append((nx, ny))
                    visited2[nx][ny] = true
                }
            }
        }
    } else {
        while !q.isEmpty {
            let (x, y) = q.removeFirst()
            
            for k in 0...3 {
                let (nx, ny) = (x + dx[k], y + dy[k])
                if nx >= n || nx < 0 || ny >= n || ny < 0 {
                    continue
                }
                if paint[nx][ny] == "R" && !visited2[nx][ny] {
                    q.append((nx, ny))
                    visited2[nx][ny] = true
                }
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if !visited1[i][j] {
            bfs1(i, j, paint[i][j])
            count1 += 1
        }
        if !visited2[i][j] {
            bfs2(i, j, paint[i][j])
            count2 += 1
        }
    }
}

print(count2, count1)
