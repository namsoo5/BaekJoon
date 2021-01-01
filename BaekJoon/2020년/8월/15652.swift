//
//  15652.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/17.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// N과 M(4)
private func solution15652() {
    let input = readLine()!.components(separatedBy: .whitespaces).map{ Int($0)! }
    let n = input[0]
    let m = input[1]
    let arr = (1...n).map{ Int($0) }
    var result = [Int](repeating: 0, count: m)
    
    func dfs(depth: Int, beforeIdx: Int) {
        if depth == m {
            let resultString = result.map{ String($0) }.joined(separator: " ")
            print(resultString)
            return
        }
        
        for i in 0..<n {
            if beforeIdx > i {
                continue
            }
            result[depth] = arr[i]
            dfs(depth: depth+1, beforeIdx: i)
        }
    }
    dfs(depth: 0, beforeIdx: 0)
}
