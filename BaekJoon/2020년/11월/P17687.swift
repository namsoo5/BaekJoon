//
//  P17687.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 시간초과
// for -> stride, insert -> append -> 차이 없음
// 불필요한 계산 String reverse 대신  b + a -> 차이 없음
// change함수 제거 -> radix 연산자이용 -> 차이 없음
// extension 제거 -> 성공
// offset 시간차이 진짜큼

// n진수 게임
private func solutionP17687(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {

    var transform: [Character] = []
    var curNum = 0
    while transform.count <= t*m {
        let change = String(curNum, radix: n, uppercase: true)
        change.forEach { transform.append($0) }
        curNum += 1
    }
    
    var result = ""
    for i in stride(from: p-1, to: transform.count, by: m) {
        result.append(transform[i])
        
        if t == result.count {
            break
        }
    }
//    print(result)
    return result
}
//
//solutionP17687(2, 4, 2, 1)
//solutionP17687(16, 16, 2, 1)
//solutionP17687(16, 16, 2, 2)
