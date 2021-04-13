//
//  P42842_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/31.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


// 카펫
private func solutionP42842(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let total = brown + yellow
    for height in 3...yellow+2 {
        let width = total / height
        
        if (width-2) * (height-2) == yellow {
                return [width, height]
        }
    }
    
    return []
}
//print(solutionP42842(10, 2))
//print(solutionP42842(8, 1))
//print(solutionP42842(24, 24))
