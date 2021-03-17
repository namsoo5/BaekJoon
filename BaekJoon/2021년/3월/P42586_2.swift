//
//  P42586_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/10.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 19:40 - 19:50
// 기능개발
private func solutionP42586(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var queue: [Int] = progresses
    var result: [Int] = []
    func excute() -> [Int] {
        var queue = queue
        for i in queue.indices {
            queue[i] += speeds[i]
        }
        return queue
    }
    
    var head = 0
    while head < progresses.count {
        queue = excute()
        
        var completeCount = 0
        while head < progresses.count, queue[head] >= 100 {
            completeCount += 1
            head += 1
        }
        if completeCount != 0 {
            result.append(completeCount)
        }
    }
//    print(result)
    return result
}

//
//solutionP42586([93, 30, 55], [1, 30, 5])
//solutionP42586([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1])
