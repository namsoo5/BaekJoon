//
//  P42889.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 실패율

private func solutionP42889(_ N:Int, _ stages:[Int]) -> [Int] {
    var scores: [Int] = Array(repeating: 0, count: N+2)
    var failRates: [Double] = Array(repeating: 0, count: N+1)
    stages.forEach { scores[$0] += 1 }
        
//    print(scores)
    var playPeople = 0
    playPeople += scores.last!
    for i in stride(from: N, through: 1, by: -1) {
        playPeople += scores[i]
        let stageNum: Double = Double(scores[i])
        let failRate: Double = stageNum / Double(playPeople)
//        print("stage: \(i) \(stageNum)/\(playPeople)")
        failRates[i] = failRate
    }
    failRates.removeFirst()
//    print(failRates)
    let result = failRates.enumerated().sorted {
        if $0.element == $1.element {
            return $0.offset < $1.offset
        } else {
            return $0.element > $1.element
        }
    }.map { $0.offset + 1 }
    
    return result
}

//solutionP42889(5, [2, 1, 2, 6, 2, 4, 3, 3])
//solutionP42889(4, [4,4,4,4,4])
