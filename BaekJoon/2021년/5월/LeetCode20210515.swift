//
//  LeetCode20210515.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func isNumber(_ s: String) -> Bool {
    let num = Double(s)
   
    // 범위초과 혹은 스트링으로 실패시
    if num == nil {
        var eCount = 0
        for c in s {
            if c == "E" || c == "e" {
                eCount += 1
            }
        }
        
        // e 여러개 불가능
        if eCount > 1 {
            return false
        }
        
        let newStrings = s.components(separatedBy: "e")
        if let _ = Double(newStrings[0]),
           let _ = Double(newStrings[1]) {
            // 부동소수점뒤에 소수점불가능
            if newStrings[1].contains(".") {
                return false
            }
            
            return true
        }
        
        return false
    }
    // 무한인경우 불가능
    if num == .infinity || num == -.infinity {
        return false
    }
    return num != nil
}
//
//print(isNumber("inf")) // false
//print(isNumber("-8115e957")) // true
//print(isNumber("3.e957")) // ture
//print(isNumber("-e9.57")) // false
