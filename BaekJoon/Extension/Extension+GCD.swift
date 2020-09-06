//
//  Extension+GCD.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
func getGCD(a: Int, b: Int) -> Int {
    var big = a > b ? a : b
    var small = big == a ? b : a
    
    var gcd = 0
    for _ in 0... {
        // 유클리드 호제법 최대공약수 알고리즘
        let remain = big%small
        if remain == 0 {
            gcd = small
            break
        }
        big = small
        small = remain
    }
    
    return gcd
}
