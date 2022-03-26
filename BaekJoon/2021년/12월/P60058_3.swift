//
//  P60058_3.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
private func solutionP60058_3(_ p:String) -> String {
    
    /// u,v분리
    func separator(s: String) -> String {
        if s.isEmpty {
            return " "
        }
        let s = s.map{ String($0) }
        var open = 0
        var close = 0
        var lastIndex = 0
        
        for i in 0..<s.count {
            let c = s[i]
            if c == "(" {
                open += 1
            } else {
                close += 1
            }
            
            if close == open {
                lastIndex = i
                break
            }
        }
        let u = s[0...lastIndex].joined()
        var v = ""
        if lastIndex+1 < s.count {
            v = s[lastIndex+1..<s.count].joined()
        }
        return "\(u) \(v)"
    }
    /// 올바른 문자열체크
    func check(s: String) -> Bool {
        var open = 0
        var close = 0
        
        for c in s {
            if c == "(" {
                open += 1
            } else {
                close += 1
            }
            
            if close > open {
                return false
            }
        }
        
        return close == open
    }

    func process(u: String, v: String) -> String {
        if u.isEmpty {
            return ""
        }
        
        if check(s: u) {
            let strings = separator(s: v)
            let uv = strings.components(separatedBy: .whitespaces)
            let newU = uv[0]
            let newV = uv[1]
            return u + process(u: newU, v: newV)
        } else {
            let strings = separator(s: v)
            let uv = strings.components(separatedBy: .whitespaces)
            let newU = uv[0]
            let newV = uv[1]
            
            let newString = "(" + process(u: newU, v: newV) + ")"
            var u = u.map { String($0) }
            u[0] = ""
            u[u.count-1] = ""
            var changeU = ""
            u.joined().forEach {
                if $0 == "(" {
                    changeU.append(")")
                } else {
                    changeU.append("(")
                }
            }
            return newString + changeU
        }
    }
    
    if check(s: p) {
        return p
    }
    
    let strings = separator(s: p)
    let uv = strings.components(separatedBy: .whitespaces)
    let u = uv[0]
    let v = uv[1]
//    print(uv)
    let newP = process(u: u, v: v)
//    print(newP)
    
    return newP
}

//solutionP60058_3("(()())()")
//solutionP60058_3(")(")
//solutionP60058_3("()))((()")
