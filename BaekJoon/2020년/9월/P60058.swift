//
//  P60058.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/02.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 카카오 블라인드2020 괄호 변환
private func solutionP60058(_ p:String) -> String {
    
    // 올바른 문자열 검사
    func isTrueString(s: String) -> Bool {
        var openCount = 0
        var closeCount = 0
        
        for c in s {
            if c == "(" {
                openCount += 1
            } else {
                closeCount += 1
            }
            if closeCount > openCount {
                return false
            }
        }
        return true
    }
    
    func makeNewString(newString: String) -> String {
        var openCount = 0
        var closeCount = 0
        var u = ""
        var v = ""
        
        for c in newString {
            if c == "(" {
                openCount += 1
            } else {
                closeCount += 1
            }
            u += String(c)
            if closeCount == openCount {
                v = String(newString.suffix(newString.count-u.count))
                break
            }
        }
//        print("u: \(u)")
//        print("v: \(v)")
//
        if isTrueString(s: u) {
            if v == "" {
                return u
            }
            
            return u+makeNewString(newString: v)
        } else {
            u.removeFirst()
            u.removeLast()
            let reverse: String = u.map {
                if String($0) == "(" {
                    return ")"
                } else {
                    return "("
                }
            }.reduce(""){ $0 + $1 }
            return "("+makeNewString(newString: v)+")"+reverse
        }
        
    }
    
    // 올바른 물자열이면 바로 출력
    if isTrueString(s: p) {
        return p
    }
    
    return makeNewString(newString: p)
}

//print(solutionP60058("(()())()"))
//print(solutionP60058(")("))
//print(solutionP60058("()))((()"))
//
