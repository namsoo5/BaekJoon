//
//  P12940.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/12.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 최대공약수와 최소공배수
private func solutionP12940(_ n:Int, _ m:Int) -> [Int] {
    
    var small = min(n, m)
    var big = max(n, m)
    var gcd = 0
    while true {
        let remain = big % small
        if remain == 0 {
            gcd = small
            break
        }
        big = small
        small = remain
    }
    
    let lcm = n * m / gcd
    
    return [gcd, lcm]
}

//solutionP12940(3, 12)
//solutionP12940(2, 5)
