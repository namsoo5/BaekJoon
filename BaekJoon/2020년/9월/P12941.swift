//
//  P12941.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/15.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 처음에 완전탐색으로 하나하나 비교하려고했으나... 시간초과..
// 두수의 곱의합의 최소를 구하는것은
// 두수의 곱이 제일 작아야하므로
// 최소값 * 최댓값을 해서 더하면 최소값의 합이될것이다...

// 최솟값만들기
private func solutionP12941(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    let A = A.sorted()
    let B: [Int] = B.sorted(){ $0 > $1 }
    for i in A.indices {
        ans += A[i] * B[i]
    }
    
    return ans
}

//solutionP12941([1, 4, 2],  [5, 4, 4])
//solutionP12941([1,2], [3,4])
//
