//
//  LeetCode20210528.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/28.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func maximumUniqueSubarray(_ nums: [Int]) -> Int {
    
    var head = 0
    var tail = 0
    var maxValue = 0
    var set = Set<Int>()
    var sum = 0
    
    while head < nums.count {
        
        // 겹치지않으면 계속추가
        var tailNum = nums[tail]
        while tail < nums.count {
            tailNum = nums[tail]
            if set.contains(tailNum) {
                break
            } else {
                set.update(with: tailNum)
                sum += tailNum
                tail += 1
            }
        }
        maxValue = max(maxValue, sum)
        
        print("::::tail result::::")
        print("curTail: \(tail)")
        print(set)
        print("max: \(maxValue)")
        
        // 겹친부분 삭제
        while head < tail {
            let num = nums[head]
            if set.contains(tailNum) {
                set.remove(num)
                sum -= num
                head += 1
            } else {
                break
            }
        }
        print("::::head result::::")
        print("curHead: \(head)")
        print("range: \(head)..<\(tail) ")
        print(set)
        
    }
    
    print(maxValue)
    
    return maxValue
}

//maximumUniqueSubarray([5,2,1,2,5,2,1,2,5])
//maximumUniqueSubarray([4,2,4,5,6])
//maximumUniqueSubarray([10000])
