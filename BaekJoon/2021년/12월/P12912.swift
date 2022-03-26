//
//  P12912.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/11.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 두 정수 사이의 합
private func solutionP12912(_ a:Int, _ b:Int) -> Int64 {
    if a == b {
        return Int64(a)
    }
  
    let minimum = min(a, b)
    let maximum = max(a, b)
    let count = maximum - minimum + 1
    let sum = Int64(a + b) * Int64(count) / 2
    return Int64(sum)
}
//solutionP12912(0, 1)
//solutionP12912(-2, 3)
//solutionP12912(3, 3)
//solutionP12912(5, 3)
