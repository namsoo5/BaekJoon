//
//  P12945.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 기본적인 재귀를 통해서 하면 시간초과
// 동적으로 구현 -> 배열과 재귀를이용, 이미있는값인경우 바로 그값 리턴 2^N
// 반복 -> 원하는 수를 반복문을 통해서 값 찾기 N

// 피보나치 수
private func solutionP12945(_ n:Int) -> Int {
    var arr = [Int](repeating: 0, count: 100001)
    
    arr[1] = 1
    func fb(_ n: Int) {
        for i in 2...n {
            arr[i] = (arr[i-2] + arr[i-1]) % 1234567
        }
    }
    fb(n)
    let result = arr[n]
//    print(result)
    return result
}
//solutionP12945(3)
//solutionP12945(5)

