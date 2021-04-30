//
//  P64062.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/22.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 징검다리 건너기
// 14:15 - 15:22
private func solutionP64062(_ stones:[Int], _ k:Int) -> Int {
    
    var left = 1
    var right = 200_000_000
    
    func isLeftAare(stones: [Int], mid: Int) -> Bool {
        var zeroCount = 0
        for stone in stones {
            if stone - mid <= 0 {
                zeroCount += 1
            } else {
                zeroCount = 0
            }
            
            if zeroCount >= k {
                return true
            }
        }
        return false
    }
    
    while left < right  {
        let mid = (left + right) / 2
        if isLeftAare(stones: stones, mid: mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}

//solutionP64062([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3)
//solutionP64062([10,100,1000,10000,10000,1000,100,10,1], 1)
