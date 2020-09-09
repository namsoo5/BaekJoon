//
//  15649.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/11.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
//N과 M(1)
private func solution15649() {
    let input = readLine()!.components(separatedBy: .whitespaces).map{ Int($0)! }
    let n = input[0]
    let m = input[1]
    let arr = (1...n).map{Int($0)}
    var visited: [Bool] = [Bool](repeating: false, count: n)
    var result: [Int] = [Int](repeating: 0, count: m)
    
    func dfs(depth: Int) {
        if depth == m {
            let resultString = result.map{String($0)}.joined(separator: " ")
            print(resultString)
            return
        }
        
        for i in 0..<n {
            if visited[i] {
                continue
            }
            visited[i] = true
            result[depth] = arr[i]
            dfs(depth: depth+1)
            visited[i] = false
        }
    }
    
    dfs(depth: 0)
}

