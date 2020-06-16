//
//  1978.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/16.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution1978() {
    let MAX = 1001
    var sosuArr = Array(repeating: 0, count: MAX)
    let sosuRange = Int(sqrt(Double(MAX)))
    sosuArr[0] = 1
    sosuArr[1] = 1
    for i in 2..<sosuRange {
        for n in stride(from: i+i, to: MAX, by: i) {
            if sosuArr[n] == 0 {
                sosuArr[n] = 1
            }
        }
    }
//    sosuArr.enumerated().filter{$1 == 0}.forEach { print($0.offset) }
    
    let _ = Int(readLine()!)!
    let inputArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var count = 0
    
    for element in inputArr {
        if sosuArr[element] == 0 {
            count += 1
        }
    }
    
    print(count)
}
solution1978()
