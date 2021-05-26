//
//  LeetCode20210525.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/25.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func evalRPN(_ tokens: [String]) -> Int {
    var stack: [Int] = []
    
    func calculate(_ op: String) -> Int {
        let num1 = stack.removeLast()
        let num2 = stack.removeLast()
        
        switch op {
        case "+":
            return num2 + num1
        case "-":
            return num2 - num1
        case "*":
            return num2 * num1
        case "/":
            return num2 / num1
        default:
            return 0
        }
    }
    
    for token in tokens {
        if let num = Int(token) {
            stack.append(num)
        } else {
            stack.append(calculate(token))
        }
    }
    
    return stack.removeLast()
}

//evalRPN(["2","1","+","3","*"])
//evalRPN(["4","13","5","/","+"])
//evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
