//
//  LeetCode20210606.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/06.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func longestConsecutive(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    var maxContinue = 0
    var tempContinue = 0
    if nums.isEmpty {
        return 0
    } else if nums.count == 1 {
        return 1
    }
    var before = nums[0]
    for i in 1..<nums.count {
        print("before: \(before) num: \(nums[i])")
        if before + 1 == nums[i] {
            tempContinue += 1
        } else if before == nums[i] {
            continue
        } else {
            maxContinue = max(maxContinue, tempContinue)
            tempContinue = 0
        }
        before = nums[i]
    }
    maxContinue = max(maxContinue, tempContinue)
    
    print(maxContinue+1)
    return maxContinue + 1
}

//longestConsecutive( [100,4,200,1,3,2])
//longestConsecutive( [0,3,7,2,5,8,4,6,0,1])
