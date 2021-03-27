//
//  P64065_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/22.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 튜플
// 20:10 - 20:25
private func solutionP64065_2(_ s:String) -> [Int] {
    var s = s
    s.removeFirst(2)
    s.removeLast(2)
    var group = s.components(separatedBy: "},{")
    group.sort { $0.count < $1.count }
       
    var result: [Int] = []
    var total = 0
    for element in group {
        let sum = element.components(separatedBy: ",")
            .map { Int($0)! }
            .reduce(0) { $0 + $1 }
        
        let value = sum - total
        total = sum
        result.append(value)
    }
    
    return result
}
//
//solutionP64065_2("{{2},{2,1},{2,1,3},{2,1,3,4}}")
//solutionP64065_2("{{1,2,3},{2,1},{1,2,4,3},{2}}")
//solutionP64065_2("{{20,111},{111}}")
//solutionP64065_2("{{123}}")
//solutionP64065_2("{{4,2,3},{3},{2,3,4,1},{2,3}}")
