//
//  P86051.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/10.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solutionP86051(_ numbers:[Int]) -> Int {
    let total = (1...9).reduce(0) { $0 + $1 }
    let sum = numbers.reduce(0) { $0 + $1 }
    return total - sum
}
//
//solutionP86051([1,2,3,4,6,7,8,0])
//solutionP86051([5,8,4,0,6,7,9])
