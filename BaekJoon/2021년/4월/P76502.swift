//
//  P76502.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/20.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 괄호 회전하기
// 23:00 - 23:22
private func solutionP76502(_ s:String) -> Int {
    
    var s = s.map { String($0) }
    
    func rotateString(_ arr: [String]) -> [String] {
        var arr = arr
        let first = arr.removeFirst()
        arr.append(first)
        return arr
    }
    
    func checkString(_ arr: [String]) -> Bool {
        var stack: [String] = []
        var openCount = 0
        
        for c in arr {
            switch c {
            case "{":
                fallthrough
            case "(":
                fallthrough
            case "[":
                stack.append(c)
                openCount += 1
            case "}":
                if stack.isEmpty {
                    return false
                }
                
                let remove = stack.removeLast()
                openCount -= 1
                if remove != "{" {
                    return false
                }
            case ")":
                if stack.isEmpty {
                    return false
                }
                
                let remove = stack.removeLast()
                openCount -= 1
                if remove != "(" {
                    return false
                }
            case "]":
                if stack.isEmpty {
                    return false
                }
                
                let remove = stack.removeLast()
                openCount -= 1
                if remove != "[" {
                    return false
                }
            default:
                break
            }
        }
        if openCount > 0 {
            return false
        }
        
        return true
    }
    var result = 0
    if checkString(s) {
        result += 1
    }
    for _ in 1..<s.count {
        s = rotateString(s)
//        print(s.joined())
        if checkString(s) {
            result += 1
        }
    }
//    print(result)
    return result
}

//solutionP76502("[](){}")
//solutionP76502("}]()[{")
//solutionP76502("[)(]")
//solutionP76502("}}}")
//solutionP76502("{{")
