//
//  P12954.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/11.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solutionP12954(_ x:Int, _ n:Int) -> [Int64] {
    var result: [Int64] = []
    if x == 0 {
        return (0..<n).map { _ in 0 }
    }
    
    for i in stride(from: x, through: x * n, by: x) {
        result.append(Int64(i))
    }
    return result
}
//
//solutionP12954(0, 5)
//solutionP12954(1, 5)
//solutionP12954(4, 3)
//solutionP12954(-4, 2)
