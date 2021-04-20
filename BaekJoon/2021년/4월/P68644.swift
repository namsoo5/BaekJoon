//
//  P68644.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/13.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 두 개 뽑아서 더하기
private func solutionP68644(_ numbers:[Int]) -> [Int] {
    var sumSet = Set<Int>()
    
    for i in numbers.indices {
        for j in i+1..<numbers.count {
            let sum = numbers[i] + numbers[j]
            sumSet.update(with: sum)
        }
    }
    
    let result = sumSet.sorted()
    print(result)
    return result
}

//    solutionP68644([2,1,3,4,1])
//solutionP68644([5,0,2,7])
