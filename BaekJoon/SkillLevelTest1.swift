//
//  SkillLevelTest.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/12/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solutionSkillTestLevel1_1(_ s:String, _ n:Int) -> String {
    
    let c: [Character] = s.map {
        if $0 == " " {
            return " "
        }
        let origin = $0.asciiValue!
        var num: UInt8 = origin + UInt8(n)
    if (origin <= 90 && num > 90) || (origin <= 122 && num > 122) {
        num -= 26
    }
        return Character(UnicodeScalar(num))
    }
    print(c.reduce(""){"\($0)\($1)"})
    return ""
}
// a: 97 ~ 122, A: 65 ~ 90
//solutionSkillTest("AB", 1)
//solutionSkillTest("z", 1)
//solutionSkillTest("a B z", 4)
//solutionSkillTest("Z", 1)

private func solutionSkillTestLevel1_2(_ x:Int, _ n:Int) -> [Int64] {
    
    let result: [Int64] = (1...n).map { Int64($0 * x) }
    return result
}

//solutionSkillTestLevel1_2(2, 5)
//solutionSkillTestLevel1_2(4, 3)
//solutionSkillTestLevel1_2(-4, 2)
