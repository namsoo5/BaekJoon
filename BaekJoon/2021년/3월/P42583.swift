//
//  P42583.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 17:25 - 18:00
// 다리를 지나는 트럭
private func solutionP42583(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var result = 0
    var head = -1
    var curWeight = 0
    var status: [Int] = Array(repeating: 0, count: truck_weights.count)
    
    while head < truck_weights.count - 1 {
        result += 1
        // 다리 지나는 수 카운트(1초에 한칸씩 이동)
        for i in status.indices {
            if status[i] > 0 {
                status[i] -= 1
                if status[i] == 0 {
                    curWeight -= truck_weights[i]
                }
            }
        }
        
        // 다리에 트럭수 추가
        let truck = truck_weights[head+1]
        if curWeight + truck <= weight {
            head += 1
            curWeight += truck
            status[head] = bridge_length
        }
        
//        print("time: \(result), cur: \(curWeight)")
//        print(status)
    }
    
    // 남은 경우 처리
    let remainSecond = status.last!
    result += remainSecond
    
//    print(result)
    return result
}

//solutionP42583(2, 10, [7,4,5,6])
//solutionP42583(100, 100, [10])
//solutionP42583(100, 100, [10,10,10,10,10,10,10,10,10,10])
