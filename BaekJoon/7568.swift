//
//  7568.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/03.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 덩치
private func solution7568() {
    let n = Int(readLine()!)!
    var input: [(Int, Int)] = []
    
    (0..<n).forEach { _ in
        let xy = readLine()!.components(separatedBy: .whitespaces).map{ Int($0)! }
        input.append((xy[0], xy[1]))
    }
        
    var result: [Int] = []
    input.forEach { value in
        var rank = 1
        input.forEach {
            if value.0 < $0.0 && value.1 < $0.1 {
                rank += 1
            }
        }
        result.append(rank)
    }
    var rankResult = ""
    result.forEach{ rankResult.append("\($0) ") }
    print(rankResult)
}

