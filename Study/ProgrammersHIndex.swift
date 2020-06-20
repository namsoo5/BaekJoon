//
//  ProgrammersHIndex.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/20.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

//프로그래머스 H-Index
func solutionHIndex(_ citations:[Int]) -> Int {
    let arr = citations.sorted{ $0>$1 }
    var count = 0
    for (i, element) in arr.enumerated() {
        if i+1 <= element  {
            count += 1
        } else {
            break
        }
    }
    return count
}

//print(solutionHIndex([3, 0, 6, 1, 5]))
//print(solutionHIndex([4, 0, 6, 1, 5]))
//print(solutionHIndex([4, 0, 8, 1, 5, 3]))
//print(solutionHIndex([11, 15, 16, 12, 18]))
