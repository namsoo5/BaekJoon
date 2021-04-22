//
//  P42862.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 체육복
private func solutionP42862(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var borrow: [Bool] = Array(repeating: false, count: n+1)
    reserve.forEach { borrow[$0] = true }
    
    var lost = lost
    lost.indices.reversed().forEach {
        let people = lost[$0]
        borrow[people] = false
        if reserve.contains(people) {
            lost.remove(at: $0)
        }
    }
    
    var result = n - lost.count
    lost.sort()
    lost.forEach {
        if $0 > 0 && borrow[$0-1] {
            borrow[$0-1] = false
            result += 1
            return
        }
        
        if $0 < n && borrow[$0+1] {
            borrow[$0+1] = false
            result += 1
            return
        }
    }
    print(result)
    return result
}

//solutionP42862(5, [2,3], [3,4])
//solutionP42862(5, [2,4], [3])
//solutionP42862(3, [3], [1])
