//
//  P42578.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/28.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 위장
private func solutionP42578(_ clothes:[[String]]) -> Int {
    var result: [String: [String]] = [:]
    
    for set in clothes {
        let key = set[1]
        let value = set[0]
        if result.keys.contains(key) {
            result[key]?.append(value)
        } else {
            result[key] = [value]
        }
    }
    
    // 부분집합 경우의 수로 생각
    // 전카테고리 경우의수 * 현재카테고리 경우의수 + 현재카테고리 경우의수
    //  (조합의 경우) + (혼자의 경우)
    var combinationCount = 0
    for key in result.keys {
        if combinationCount == 0 {
            combinationCount = result[key]!.count
        } else {
            combinationCount += combinationCount * result[key]!.count + result[key]!.count
        }
    }
    
    return combinationCount
}
