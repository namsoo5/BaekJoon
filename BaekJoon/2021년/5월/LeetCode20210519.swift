//
//  LeetCode20210519.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func minMoves2(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    let mid = nums.count/2
    var count = Int.max
    
    // 중앙값인 경우가 최소움직이는경우
    func moveCount(n: Int) -> Int {
        var move = 0
        let midNum = nums[n]
        // 중앙값과 차이만큼 이동
        for num in nums {
            move += abs(midNum-num)
        }
        return move
    }
    
    if mid > 0 {
        let move = moveCount(n: mid-1)
        count = min(count, move)
    }
    
    let move = moveCount(n: mid)
    count = min(count, move)
    
    print(count)
    return count
}
//
//minMoves2([1,2,3])
//minMoves2([1,10,2,9])
