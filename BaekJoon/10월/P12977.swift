//
//  P12977.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 소수 만들기
private func solutionP12977(_ nums:[Int]) -> Int {
    var result = 0
    let sortedArr = nums.sorted()
    let maxSum: Int
    
    if nums.count > 2 {
        maxSum = sortedArr[nums.count-1] + sortedArr[nums.count-2] + sortedArr[nums.count-3]
    } else if nums.count > 1 {
        maxSum = sortedArr[nums.count-1] + sortedArr[nums.count-2]
    } else {
        maxSum = sortedArr[nums.count-1]
    }
    let sosuArr = searchSosu(max: maxSum)
    let sosu = sosuArr.enumerated().filter { $0.element == 0 }.map{ $0.offset }
    
    func combine(sum: Int, start:Int, depth: Int) {
        if depth == 3 {
            if sosu.contains(sum) {
                result += 1
            }
            return
        }
        
        for i in start..<nums.count {
            let num = nums[i]
            combine(sum: sum+num, start: i+1, depth: depth+1)
        }
    }
    
    for i in 0..<nums.count {
        combine(sum: nums[i], start: i+1, depth: 1)
    }
    
    return result
}

//solutionP12977([1,2,3,4])
//solutionP12977([1,2,7,6,4])
