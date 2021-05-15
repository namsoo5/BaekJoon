//
//  P12979.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/13.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 기지국 설치
private func solutionP12979(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    
    func install(distance: Int) -> Int {
        let wide = w * 2 + 1
        return Int(ceil(Double(distance) / Double(wide)))
    }
    
    // 왼쪽범위
    let left = stations[0] - w - 1
    if left > 0 {
        answer += install(distance: left)
    }
    
    // 오른쪽범위
    let right = n - (stations.last! + w)
    if right > 0 {
        answer += install(distance: right)
    }
    
    // 사이범위
    if stations.count > 1 {
        for i in 1..<stations.count {
            let distance = stations[i] - stations[i-1] - (2 * w) - 1
            answer += install(distance: distance)
        }
    }
    
//    print(answer)
    return answer
}

//solutionP12979(11, [4,11], 1)
//solutionP12979(16, [9], 2)
