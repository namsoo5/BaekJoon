//
//  LeetCode20210618.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/18.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private class NumArray {
    private var nums: [Int] = []
    private var start = -1
    private var end = -1
    private var sum = 0

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func update(_ index: Int, _ val: Int) {
        if start <= index && index <= end {
            sum -= nums[index]
            sum += val
        }
        nums[index] = val
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        //        return nums[left...right].reduce(0) { $0 + $1 }
        if start == -1 && end == -1 {
            sum = nums[left...right].reduce(0) { $0 + $1 }
        } else {
            if left < start {
                for i in left..<start {
                    sum += nums[i]
                }
            } else if start < left {
                for i in start..<left {
                    sum -= nums[i]
                }
            }
            
            if right < end {
                for i in right+1...end {
                    sum -= nums[i]
                }
            } else if end < right {
                for i in end+1...right {
                    sum += nums[i]
                }
            }
        }
        start = left
        end = right
        print(sum)
        return sum
    }
}

//let obj = NumArray([1,3,5])
//obj.sumRange(0, 2)
//obj.update(1, 2)
//obj.sumRange(0, 2)

