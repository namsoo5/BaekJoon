//
//  P60058.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/17.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 괄호 변환
// 17:50 - 19:10
private func solutionP60058(_ p:String) -> String {
    
    let arr: [Character] = p.map { $0 }
    
    // 올바른 문자열인지 검사
    func checkString(_ s: String) -> Bool {
        var stack: [Character] = []
        for c in s {
            if c == "(" {
                stack.append(c)
            } else if c == ")" {
                if stack.isEmpty {
                    return false
                }
                stack.removeLast()
            }
        }
        return true
    }
    
    // 괄호방향 변환
    func reverseString(_ s: [Character]) -> String {
        var s = s
        s.removeLast()
        s.removeFirst()
        var string = ""
        for c in s {
            if c == "(" {
                string += ")"
            } else {
                string += "("
            }
        }
        return string
    }
    
    func newString(_ s: [Character]) -> String {
        if s.isEmpty {
            return ""
        }
        
        var openCount = 0
        var closeCount = 0
        var u = ""
        var v: String = ""
        for c in s {
            if c == "(" {
                openCount += 1
            } else if c == ")" {
                closeCount += 1
            }
            u += "\(c)"
            if openCount == closeCount {
                let startIndex = openCount+closeCount
                if startIndex >= s.count {
                    break
                }
                v = s[startIndex..<s.count].map{String($0)}.joined()
                break
            }
        }
//        print("u: \(u), v: \(v)")
        if checkString(u) {
            if v == "" {
                return u
            }
            
            let string = u + newString(v.map{$0})
            return string
        } else {
            let reverse = reverseString(u.map{$0})
            let string = "(\(newString(v.map{$0})))\(reverse)"
            return string
        }
    }
    
    if checkString(p) {
        print(p)
        return p
    } else {
        let result = newString(arr)
        print(result)
        return result
    }
}

//solutionP60058("(()())()")
//solutionP60058("()))((()")
//solutionP60058(")(")

