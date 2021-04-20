//
//  P17687_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/13.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


// n진수 게임
private func solutionP17687(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
 
    var num = 0
    var stack: [Character] = []
    
    // 말할 수 있는 최대수는 t*m 을 넘지않음
    // 해당 수만큼 n진수에 맞게 말해야하는 숫자를 넣어둠
    while stack.count < t * m {
        let radixString = String(num, radix: n, uppercase: true)
        radixString.forEach { stack.append($0) }
        num += 1
    }
    
//    print(stack)
    
    var result = ""
    for i in stride(from: p-1, through: stack.count, by: m) {
        result.append(stack[i])
        if result.count == t {
            break
        }
    }
//    print(result)
    return result
}
//
//solutionP17687(2,    4,    2,    1)
//solutionP17687(16, 16, 2, 1)
//solutionP17687(16, 16, 2, 2)
