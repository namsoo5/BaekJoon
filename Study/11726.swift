//
//  11726.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 2 x n 타일링

// d(5) = d(4) + d(3)
// d(3) = d(2) + d(1)
private func solution11726() {
    let n = Int(readLine()!)!
    var dList = Array(repeating: 0, count: n+1)
    dList[1] = 1
    dList[2] = 2
    
    for j in 3...n {
        dList[j] = (dList[j-2] + dList[j-1]) % 10007
    }
    print(dList[n])
}
