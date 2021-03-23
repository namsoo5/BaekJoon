//
//  P43165_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 타겟 넘버
// 20:40 - 21:10
private func solutionP43165_2(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(numbers: [Int], index: Int) {
        print(numbers)
        let sum = numbers.reduce(0) { $0 + $1 }
        if sum < target {
            return
        }
        if sum == target {
            result += 1
            return
        }
        
        var numbers = numbers
        for i in index..<numbers.count {
            let num = numbers[i]
            if num < 0 {
                continue
            }
            numbers[i] = -num
            dfs(numbers: numbers, index: i+1)
            numbers[i] = num
        }
    }
    dfs(numbers: numbers, index: 0)
    print(result)
    return result
}

//solutionP43165_2([1,1,1,1,1], 3)
//solutionP43165_2([1,2,3,4,5,6,7], 4)
