//
//  42587.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/02/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 프린터
private func solutionP42587(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue: [Int] = priorities
    var location = location
    var result = 0
    while !queue.isEmpty {
        let highPriority = queue.max()!
        let value = queue.removeFirst()
        
        if value == highPriority {
            result += 1
            if location == 0 {
                break
            }
        } else {
            queue.append(value)
            if location == 0 {
                location = queue.count
            }
        }
        location -= 1
    }
    
    return result
}

//solutionP42587([2,1,3,2], 2)
//solutionP42587([1,1,9,1,1,1], 0)

