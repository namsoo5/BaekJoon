//
//  P43165_3.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/04.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 타겟 넘버
private func solutionP43165(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    func dfs(numbers: [Int], i: Int) {
        var numbers = numbers
        print(numbers)
        let sum = numbers.reduce(0) { $0 + $1 }
        if sum < target {
            return
        }
        if sum == target {
            result += 1
            return
        }
        
        for j in i..<numbers.count {
            numbers[j] = -numbers[j]
            dfs(numbers: numbers, i: j+1)
            numbers[j] = -numbers[j]
        }
    }
    
    dfs(numbers: numbers, i: 0)
    return result
}

//solutionP43165([1, 1, 1, 1, 1], 4)
