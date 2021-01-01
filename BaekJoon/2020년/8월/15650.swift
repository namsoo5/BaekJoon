//
//  15650.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// N과 M(2)
private func solution15650() {
    let input = readLine()!.components(separatedBy: .whitespaces).map{ Int($0)! }
    let n = input[0]
    let m = input[1]
    var visited = [Bool](repeating: false, count: n)
    let arr = (1...n).map{Int($0)}
    var result = [Int](repeating: 0, count: m)
    
    func dfs(depth: Int, curIndex: Int) {
        if depth == m {
            let resultString = result.map{ String($0) }.joined(separator: " ")
            print(resultString)
            return
        }
        
        for i in depth..<n {
            if visited[i] || curIndex > i {
                continue
            }
            
            visited[i] = true
            result[depth] = arr[i]
            dfs(depth: depth+1, curIndex: i)
            visited[i] = false
        }
    }
    dfs(depth: 0, curIndex: 0)
}
