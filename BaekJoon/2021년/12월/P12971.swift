//
//  P12971.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/13.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 스티커 모으기(2)
/// 점화식문제
private func solutionP12971(_ sticker:[Int]) -> Int{
    if sticker.count <= 3 {
        return sticker.max()!
    }
    // 첫번재 스티커뗀경우
    var d1 = [Int](repeating: 0, count: sticker.count)
    // 첫번재 스티커 안 뗀경우
    var d2 = [Int](repeating: 0, count: sticker.count)
        
    d1[0] = sticker[0]
    d1[1] = sticker[0]
    
    d2[0] = 0
    d2[1] = sticker[1]

    for i in 2..<sticker.count-1 {
        d1[i] = max(d1[i-2] + sticker[i], d1[i-1])
    }
    for i in 2..<sticker.count {
        d2[i] = max(d2[i-2] + sticker[i], d2[i-1])
    }
    
    print(d1)
    print(d2)
    return max(d1[sticker.count-2], d2[sticker.count-1])
}

//print(solutionP12971([14, 6, 5, 11, 3, 9, 2, 10]))
//print(solutionP12971([1,3,2,5,4]))
//print(solutionP12971([5, 1, 16, 17,  16]))
//solutionP12971([10,10,10,10,10,10,10,10])
