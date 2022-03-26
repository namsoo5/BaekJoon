//
//  P12931.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/16.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 자릿수 더하기
private func solutionP12931(_ n: Int) -> Int {
    var sum = 0
    String(n).forEach { sum += Int(String($0))! }
    print(sum)
    return sum
}

//solutionP12931(123)
