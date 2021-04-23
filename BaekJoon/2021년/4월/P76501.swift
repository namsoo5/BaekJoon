//
//  P76501.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 음양 더하기
private func solutionP76501(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var sum = 0
    for i in absolutes.indices {
        if signs[i] {
            sum += absolutes[i]
        } else {
            sum -= absolutes[i]
        }
    }
    
    return sum
}
