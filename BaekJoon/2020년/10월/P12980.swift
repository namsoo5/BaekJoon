//
//  P12980.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/17.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 점프와 순간이동
private func solutionP12980(_ n:Int) -> Int {
    var ans:Int = 1
    var n = n
    
    while n > 1 {
        if n % 2 == 0 {
            n /= 2
        } else {
            ans += 1
            n -= 1
            n /= 2
        }
    }
    return ans
}

//
//solutionP12980(5)
//solutionP12980(6)
//solutionP12980(5000)
