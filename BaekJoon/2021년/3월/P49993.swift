//
//  P49993.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 16:50 - 17:00
// 스킬트리
private func solutionP49993(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    let skill = skill.map { $0 }
    for element in skill_trees {
        var head = 0
        var isCan: Bool = true
        for c in element {
            if skill.contains(c) {
                if c != skill[head] {
                    isCan = false
                    break
                } else {
                    head += 1
                }
            }
            if head >= skill.count {
                break
            }
        }
        if isCan {
            result += 1
        }
    }
    
    return result
}

//solutionP49993("CBD", ["BACDE", "CBADF", "AECB", "BDA"])

