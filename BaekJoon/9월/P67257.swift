//
//  P67257.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/11.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

//2020 카카오 인턴십 수식 최대화
private func solutionP67257(_ expression:String) -> Int64 {
    var max = 0
    var operators: [[Character]] = [["+", "-", "*"],
                     ["+", "*", "-"],
                     ["-", "+", "*"],
                     ["-", "*", "+"],
                     ["*", "-", "+"],
                     ["*", "+", "-"]]
    
    var arr: [String] = []
    var buffer = ""
    for c in expression {
        if c == "-" || c == "+" || c == "*" {
            arr.append(buffer)
            arr.append(String(c))
            buffer = ""
        } else {
            buffer += String(c)
        }
    }
    arr.append(buffer)
    arr = arr.reversed()
    
    func stringCalcul(_ a: String, _ b: String, oper: String) -> String {
        switch oper {
        case "+":
            return String(Int(a)!+Int(b)!)
        case "-":
            return String(Int(a)!-Int(b)!)
        case "*":
            return String(Int(a)!*Int(b)!)
        default:
            return ""
        }
    }
    
    
    while !operators.isEmpty {
        var tempArr = arr
        let opers = operators.removeFirst()
//        print(opers)
//        print("--------------")
        for oper in opers {
            if !tempArr.contains(String(oper)) {
                continue
            }
            for i in stride(from: tempArr.count-1, through: 0, by: -1) {
                
                if i == 0 || i >= tempArr.count-1 {
                    continue
                }
                
                if String(oper) == tempArr[i] {
//                    print(oper)
//                    print(tempArr)
                    tempArr[i+1] = stringCalcul(tempArr[i+1], tempArr[i-1], oper: String(oper))
                    tempArr.remove(at: i-1)
                    tempArr.remove(at: i-1)
//                    print(tempArr)
                    
                }
            }
            if tempArr.count == 1 {
                if max < abs(Int(tempArr[0])!) {
                    max = abs(Int(tempArr[0])!)
                }
            }
        }
    }
//    print(max)
    return Int64(max)
}

//solution("100-200*300-500+20")
//solution("50*6-3*2")
