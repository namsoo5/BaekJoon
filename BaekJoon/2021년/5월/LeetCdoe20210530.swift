//
//  LeetCdoe20210530.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/30.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func maximumGap(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    
    var gap = 0
    
    for i in 1..<nums.count {
        let newGap = nums[i] - nums[i-1]
        gap = max(newGap, gap)
    }
    
    print(gap)
    return gap
}

//maximumGap([3,6,9,1])
//maximumGap([10])
