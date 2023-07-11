//
//  main.swift
//  0711
//
//  Created by Chaeeun Shin on 2023/07/11.
//

import Foundation

let n = Int(readLine()!)!
var tree: [String: [String]] = [:]

for _ in 0..<n {
    let temp = readLine()!.components(separatedBy: " ").compactMap{ String($0) }
    let (root, l, r) = (temp[0], temp[1], temp[2])
    
    tree[root] = [l, r]
}

preorder("A")
print()
inorder("A")
print()
postorder("A")

func preorder(_ root: String) {
    if root != "." {
        print(root, terminator: "")
        preorder(tree[root]![0])
        preorder(tree[root]![1])
    }
}

func inorder(_ root: String) {
    if root != "." {
        inorder(tree[root]![0])
        print(root, terminator: "")
        inorder(tree[root]![1])
    }
}

func postorder(_ root: String) {
    if root != "." {
        postorder(tree[root]![0])
        postorder(tree[root]![1])
        print(root, terminator: "")
    }
}


