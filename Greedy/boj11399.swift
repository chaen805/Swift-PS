//
//  main.swift
//  1d1ps
//
//  Created by Chaeeun Shin on 2023/06/21.
//

import Foundation

let n = Int(readLine()!)!
var P = readLine()!.components(separatedBy: " ").compactMap{Int($0)}
//var P = readLine()!.split(separator: " ").compactMap{Int($0)}
P.sort(by: >)

var answer = 0

for (i, t) in P.enumerated() {
    answer += ((i+1) * t)
}

print(answer)

/*
 입력 쪼개기
 components - 반환값이 String / import Foundation 필수 / 공백 아닌 문자열로도 쪼개기 가능!
 split - 반환값이 SubString / component 보다 빠른듯..?
*/
