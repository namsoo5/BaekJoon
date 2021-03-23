//
//  P42747.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 15:55 - 16:50
// H-Index
private func solutionP42747(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var result = -1
    for i in citations.indices {
        let value = citations[i]
        let h = i+1
        
        if h > value {
            result = i
            break
        }
    }
    if result == -1 {
        return citations.count
    }
    print(citations)
    print(result)
    return result
}

//solutionP42747([3,0,6,1,5])
//solutionP42747([4, 4, 4, 5, 0, 1, 2, 3])
//solutionP42747([0, 0 ,1 ,1])
//solutionP42747([2, 7, 5])
//solutionP42747([10, 11, 12, 13])
