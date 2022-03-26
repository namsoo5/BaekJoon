//
//  P77885.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 2개 이하로 다른 비트
private func solutionP77885(_ numbers:[Int64]) -> [Int64] {
    
    func f(x: Int) -> Int64 {
        if x % 2 == 0 {
            return Int64(x + 1)
        }
        var numBinary = String(x, radix: 2, uppercase: false).map{ String($0) }
        numBinary.insert("0", at: 0)
        for i in stride(from: numBinary.count-1, through: 0, by: -1) {
            if numBinary[i] == "0" {
                numBinary[i] = "1"
                numBinary[i+1] = "0"
                break
            }
        }
        
        let result = Int(numBinary.joined(), radix: 2)!
        return Int64(result)
    }
    
    var result: [Int64] = []
    
    for number in numbers {
        let num = f(x: Int(number))
        result.append(num)
    }
    print(result)
    return result
}

//solutionP77885([2,7])
