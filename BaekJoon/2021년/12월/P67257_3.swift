//
//  P67257_3.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/17.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solutionP67257_3(_ expression:String) -> Int64 {
    var operators: [String] = []
    let numbers = expression.components(separatedBy: ["+","-","*"])
    for c in expression {
        if c == "+" || c == "*" || c == "-" {
            operators.append(String(c))
        }
    }
    var memory: [String] = []
    for i in 0..<numbers.count {
        memory.append(numbers[i])
        if i < operators.count {
            memory.append(operators[i])
        }
    }
    print(memory)
    let priorities: [[String]] = [["*", "+", "-"],
                                  ["*", "-", "+"],
                                  ["+", "*", "-"],
                                  ["+", "-", "*"],
                                  ["-", "*", "+"],
                                  ["-", "+", "*"]]
    
    
    func calculate(_ c: String, foo1: String, foo2: String) -> String {
        switch c {
        case "+":
            return String(Int(foo1)! + Int(foo2)!)
        case "-":
            return String(Int(foo1)! - Int(foo2)!)
        case "*":
            return String(Int(foo1)! * Int(foo2)!)
        default:
            return ""
        }
    }
    
    var maxNum = 0
    for priority in priorities {
        var temp = memory
        for op in priority {
            var stack: [String] = []
            var isCalculate = false
            for element in temp {
                if isCalculate {
                    let c = stack.removeLast()
                    let firstNum = stack.removeLast()
                    let result = calculate(c, foo1: firstNum, foo2: element)
                    stack.append(result)
                    isCalculate = false
                    continue
                }
                
                if element == op {
                    isCalculate = true
                }
                
                stack.append(element)
            }
            temp = stack
//            print("op: \(op) \(temp)")
        }
        if let result = Int(temp.first!) {
            maxNum = max(abs(result), maxNum)
        }
    }
    
    print(maxNum)
    return Int64(maxNum)
}

//solutionP67257_3("100-200*300-500+20")
//solutionP67257_3("50*6-3*2")
