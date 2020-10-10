//
//  P64065.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/07.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 2019카카오 개발자 겨울 인턴십 튜플
private func solutionP64065(_ s:String) -> [Int] {
    let startIndex = s.index(s.startIndex, offsetBy: 2)
    let endIndex = s.index(s.endIndex, offsetBy: -2)
    let s = s[startIndex..<endIndex]
    let arr = s.components(separatedBy: "},{")
    
    var sumArr: [Int] = []
    var maxNum = 0
    for list in arr {
        let numArr = list.components(separatedBy: ",").map{ Int($0)! }
        let sum = numArr.reduce(0){ $0 + $1 }
        sumArr.append(sum)
        if maxNum < sum {
            maxNum = sum
        }
    }
    
    sumArr.sort()
    var result: [Int] = []
    result.append(sumArr[0])
    for i in 0..<sumArr.count-1 {
        result.append(sumArr[i+1]-sumArr[i])
    }
    
    return result
}

//solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
//solution("{{1,2,3},{2,1},{1,2,4,3},{2}}")
//solution("{{20,111},{111}}")
//solution("{{123}}")
//solution("{{4,2,3},{3},{2,3,4,1},{2,3}}")
