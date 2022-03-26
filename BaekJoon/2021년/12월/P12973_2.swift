//
//  P12973_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/16.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 짝지어 제거하기
private func solutionP12973_2(_ s:String) -> Int {
    var stack: [Character] = []
    
    for c in s {
        stack.append(c)
        
        if stack.count < 2 {
            continue
        }
        
        var top = stack.count - 1
        let topWord = stack[top]
        
        while top > 0 {
            top -= 1
            let word = stack[top]
            if topWord == word {
                if top == stack.count - 2 {
                    stack.removeLast()
                }
                stack.removeLast()
            } else {
                break
            }
        }
    }
    
    print(stack)
    return stack.isEmpty ? 1 : 0
}

//solutionP12973_2("baabaa")
//solutionP12973_2("cdcd")
