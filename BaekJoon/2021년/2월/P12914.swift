//
//  P12914.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/02/02.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 멀리 뛰기
private func solutionP12914(_ n:Int) -> Int {
    var save: [Int: Int] = [:]
    save[0] = 0
    save[1] = 1
    save[2] = 2
    
    func d(_ n: Int) -> Int {
        if save.keys.contains(n) {
            return save[n]!
        }
        save[n] = (d(n-2) + d(n-1)) % 1234567
        return save[n]!
    }
    let result = d(n)
    print(result)
    
    return result
}

//solutionP12914(1000)
//solutionP12914(3)

