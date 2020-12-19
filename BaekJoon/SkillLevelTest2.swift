//
//  SkillLevelTest2.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/12/16.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation


private func solutionLevelTest2_2(_ clothes:[[String]]) -> Int {
    
    var kind: [String: Int] = [:]
    
    clothes.forEach {
        if kind.keys.contains($0[1]) {
            kind[$0[1]]! += 1
        } else {
            kind[$0[1]] = 1
        }
    }
    
    var result = 0
    
    // 부분집합 경우의 수로 생각
    // 전카테고리 경우의수 * 현재카테고리 경우의수 + 현재카테고리 경우의수
    //  (조합의 경우) + (혼자의 경우)
    kind.forEach {
        if result == 0 {
            result = $0.value
        } else {
            result += result * $0.value + $0.value
        }
    }
    
    return result
//}
//
//solutionLevelTest2_2([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
//solutionLevelTest2_2([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]])
//
//



private func solutionLevelTest2_1(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {

    func changeRadix(num: Int) -> String {
        return String(num, radix: n, uppercase: true)
    }

    var queue: [Character] = []
    for i in 0..<m*t {
        let num = changeRadix(num: i)
        num.forEach { queue.append($0) }
    }

    var result = ""
    for i in 0..<m*t {
        if (i-p+1) % m == 0 {
            result.append(queue[i])
        }

        if result.count == t {
            break
        }
    }
//    print(result)
    return result
}

//solutionLevelTest2_1(2, 4, 2, 1)
//solutionLevelTest2_1(16, 16, 2, 1)
//solutionLevelTest2_1(16, 16, 2, 2)
