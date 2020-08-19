//
//  P42842.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
//카펫
private func solutionP42842(_ brown:Int, _ yellow:Int) -> [Int] {
    
    for i in 1...yellow {
        if yellow % i == 0 {
            let value = yellow/i*2 + (i+2)*2
            if value == brown {
                return [yellow/i+2, i+2]
            }
        }
    }
    return []
}
