//
//  15651.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// N과 M(3)
private func solution15651() {
    let input = readLine()!.components(separatedBy: .whitespaces).map{ Int($0)! }
    let n = input[0]
    let m = input[1]
    var result = [Int](repeating: 0, count: m)
    var resultString = ""
    func dfs(depth: Int) {
        if depth == m {
            let tempString = result.map{ String($0) }.joined(separator: " ")
            resultString.append("\(tempString)\n")
            return
        }
        
        for i in 0..<n {
            result[depth] = i+1
            dfs(depth: depth+1)
        }
    }
    dfs(depth: 0)
    print(resultString)
}
