//
//  P43238_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 입국심사
private func solutionP43238_2(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    var maxTime = times.last! * n
    var minTime = 1
    var result = 0
    
    while minTime <= maxTime {
        let mid = (minTime + maxTime) / 2
        let posiblePeople = times.reduce(0) { $0 + mid / $1 }
        print(posiblePeople)
        if posiblePeople < n {
            minTime = mid+1
        } else {
            maxTime = mid-1
            result = mid
        }
    }
    
    return Int64(result)
}

//solutionP43238_2(6, [7, 10])
