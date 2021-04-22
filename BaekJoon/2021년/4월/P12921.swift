//
//  P12921.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 소수찾기
private func solutionP12921(_ n:Int) -> Int {
    if n == 2 {
            return 1
        }
    let result = searchSosu(max: n).filter { $0 == 0}.count
    print(result)
    return result
}

//solutionP12921(2)
