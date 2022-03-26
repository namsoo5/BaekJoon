//
//  P12928.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solutionP12928(_ n:Int) -> Int {
    var sum = 0
    if n == 0 {
        return 0
    }
    
    for i in 1...n {
        if n % i == 0 {
            sum += i
        }
    }
    
    print(sum)
    return sum
}

//solutionP12928(1)
