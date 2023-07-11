//
//  main.swift
//  0711
//
//  Created by Chaeeun Shin on 2023/07/11.
//

import Foundation

let n = Int(readLine()!)!
var tree : [[Int]] = Array(repeating: [], count: n+1)
var isCut = Array(repeating: false, count: n+1)

for _ in 1..<n {
    let ab = readLine()!.components(separatedBy: " ").compactMap{ Int(String($0)) }
    let (a, b) = (ab[0], ab[1])
    
    tree[a].append(b)
    tree[b].append(a)
}

dfs(1, 0)

let q = Int(readLine()!)!

for _ in 0..<q {
    let tk = readLine()!.components(separatedBy: " ").compactMap{ Int(String($0)) }
    let (t, k) = (tk[0], tk[1])
    
    if t == 1 {
        print(isCut[k] ? "yes" : "no")
    } else {
        print("yes")
    }
}


func dfs(_ i: Int, _ p: Int) {
    var child = 0
    for j in tree[i] {
        if j == p {
            continue
        }
        child += 1
        dfs(j, i)
    }
    
    if i == 1 {
        if child >= 2 {
            isCut[i] = true
        }
    } else {
        if child > 0 {
            isCut[i] = true
        }
    }
}
