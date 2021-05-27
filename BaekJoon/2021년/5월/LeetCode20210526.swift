//
//  LeetCode20210526.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/26.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func minPartitions(_ n: String) -> Int {
    var maxNum = 0
    let n = n.map { String($0) }
    for c in n {
        let num = Int(c)!
        maxNum = max(num, maxNum)
    }
    
    return maxNum
}
