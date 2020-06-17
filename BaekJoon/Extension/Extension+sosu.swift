//
//  Extension+sosu.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/17.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 소수이면 0
func searchSosu(max: Int) -> [Int] {
    let MAX = max
    var sosuArr = Array(repeating: 0, count: MAX+1)
    let sosuRange = Int(sqrt(Double(MAX)))
    sosuArr[0] = 1
    sosuArr[1] = 1
    for i in 2...sosuRange {
        if sosuArr[i] == 1 {
            continue
        }
        for n in stride(from: i+i, through: MAX, by: i) {
            if sosuArr[n] == 0 {
                sosuArr[n] = 1
            }
        }
    }
//    sosuArr.enumerated().filter{$1 == 0}.forEach { print($0.offset) }
    return sosuArr
}
