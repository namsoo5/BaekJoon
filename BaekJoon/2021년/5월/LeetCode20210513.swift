//
//  LeetCode20210513.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/13.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// leetcode 5/13
private func ambiguousCoordinates(_ s: String) -> [String] {
    var s = s.map { String($0) }
    s.removeLast()
    s.removeFirst()
    
    func combinateString(s: String) -> [String] {
        var result: [String] = []
        
        // 콤마 분리전 자기자신도 그룹에 추가
        if String(Int(s)!) == s {
            result.append(s)
        }
        
        // 콤마는 2자리 이상의 문자열부터 추가할 수 있음
        if s.count < 2 {
            return result
        }
        
        let s = s.map { String($0) }
        for i in 1..<s.count {
            var tempS = s
            tempS.insert(".", at: i)
            let leftComma = tempS[0..<i].joined()
            let rightComma = tempS[i+1..<tempS.count].joined()
            
            // 소수점기준으로 앞에 01, 00과 같은경우 검사
            if String(Int(leftComma)!) != leftComma {
                continue
            }
            
            // 소수점기준으로 뒤에 1.0과 같이 0으로 끝나는지 검사
            if rightComma.last! == "0" {
                continue
            }
            
            let commaString = tempS.joined()
            result.append(commaString)
        }
        return result
    }
    
    // 그룹조합
    func combine(fronts: [String], backs: [String]) -> [String] {
        var result: [String] = []
        
        for front in fronts {
            for back in backs {
                result.append("(\(front), \(back))")
            }
        }
        return result
    }
    
    func floatComma(front: String, back: String) -> [String] {
        var group: [String] = []
//        print("f: \(front) b: \(back)")
        
        // 콤마 조합한 그룹
        let frontGroup = combinateString(s: front)
        let backGroup = combinateString(s: back)
        
//        print("frontGroup: \(frontGroup)")
//        print("backGroup: \(backGroup)")
        // 콤마그룹끼리 조합
        if !frontGroup.isEmpty && !backGroup.isEmpty {
            group += combine(fronts: frontGroup, backs: backGroup)
        }
        
        return group
    }
    
    var result: [String] = []
    for i in 0..<s.count-1 {
        let front: String = s[0...i].joined()
        let back: String = s[i+1..<s.count].joined()
        
        result += floatComma(front: front, back: back)
    }
    
    print(result)
//    print("-----")
    return result
}
//
//ambiguousCoordinates("(123)")
//ambiguousCoordinates("(00011)")
//ambiguousCoordinates("(0123)")
//ambiguousCoordinates("(100)")
