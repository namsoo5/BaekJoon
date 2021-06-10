//
//  LeetCode20210607.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func minCostClimbingStairs(_ cost: [Int]) -> Int {
    
    var dic: [Int: Int] = [:]
    func floor(i: Int) -> Int {
        if i < 0 {
            return 0
        }
        if dic.keys.contains(i) {
            return dic[i]!
        }
        
        dic[i] = cost[i] + min(floor(i: i-2), floor(i: i-1))
        return dic[i]!
    }
    
    let num = min(floor(i: cost.count-1), floor(i: cost.count-2))
    print(num)
    
    return num
}

//minCostClimbingStairs([10,15,20])
//minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
//minCostClimbingStairs([0,1,2,2])
