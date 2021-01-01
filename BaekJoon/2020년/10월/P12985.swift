//
//  P12985.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/19.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 예상 대진표
private func solutionP12985(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 1
    var a = a
    var b = b
    
    for _ in 1...Int(log2(Double(n))) {
        let nextA = (a+1)/2
        let nextB = (b+1)/2
        
        if nextA == nextB {
            break
        }
        
        a = nextA
        b = nextB
        answer += 1
    }
    print(answer)
    return answer
}

//solutionP12985(8, 4, 7)
