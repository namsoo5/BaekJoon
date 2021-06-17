//
//  LeetCode20210617.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/17.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
    
    var result: [[Int]] = []
    for i in 0..<nums.count {
        var temp: [Int] = []
        let num = nums[i]
        var maxValue = num
       
        if maxValue > right {
            continue
        }
        if maxValue >= left && maxValue <= right {
            temp.append(num)
            result.append(temp)
        } else {
            temp.append(num)
        }
        
        for j in i+1..<nums.count {
            let element = nums[j]
            maxValue = max(maxValue, element)
            if maxValue > right {
                break
            }
            if maxValue >= left && maxValue <= right {
                temp.append(element)
                result.append(temp)
            } else {
                temp.append(element)
            }
        }
    }
    
    print(result)
    return result.count
}
//numSubarrayBoundedMax([2,1,4,3], 2, 3)
//numSubarrayBoundedMax([73,55,36,5,55,14,9,7,72,52], 32, 69) // 22
//numSubarrayBoundedMax([876,880,482,260,132,421,732,703,795,420,871,445,400,291,358,589,617,202,755,810,227,813,549,791,418,528,835,401,526,584,873,662,13,314,988,101,299,816,833,224,160,852,179,769,646,558,661,808,651,982,878,918,406,551,467,87,139,387,16,531,307,389,939,551,613,36,528,460,404,314,66,111,458,531,944,461,951,419,82,896,467,353,704,905,705,760,61,422,395,298,127,516,153,299,801,341,668,598,98,241],
//                      658,
//                      719) // 19
