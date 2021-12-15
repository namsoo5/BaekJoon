//
//  P70128.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/11.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 내적
private func solutionP70128(_ a:[Int], _ b:[Int]) -> Int {
    
    var sum = 0
    for i in 0..<a.count {
        sum += a[i] * b[i]
    }
    
    return sum
}
