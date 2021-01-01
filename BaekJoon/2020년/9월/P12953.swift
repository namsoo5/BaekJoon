//
//  P12953.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/25.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// N개의 최소공배수
private func solutionP12953(_ arr:[Int]) -> Int {
    var result = 1
    
    arr.forEach {
        let gcd = getGCD(a: result, b: $0)
        result *= $0 / gcd
    }
    print(result)
    return result
}
//solutionP12953([2,6,8,14])
//solutionP12953([1,2,3])
