//
//  P42578.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 18:00 - 18:25
// 위장
private func solutionP42578_2(_ clothes:[[String]]) -> Int {
    var category: [String: Int] = [:]
    
    for cloth in clothes {
        let key = cloth[1]
        if category.keys.contains(key) {
            category[key]! += 1
        } else {
            category[key] = 1
        }
    }
    
    var result = 1
    // 종류마다 공집합을 포함시킨뒤 곱하고 마지막에 공집합만으로 이뤄질 수 있는 1가지 경우를 뺌
    for kind in category {
        result *= (kind.value + 1)
    }
    result -= 1
    
    print(result)
    return result
}
//
//solutionP42578_2([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
//
//solutionP42578_2([["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]])
