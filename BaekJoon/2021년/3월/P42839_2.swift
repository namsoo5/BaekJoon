//
//  P42839_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/02.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 소수찾기
private func solutionP42839_2(_ numbers:String) -> Int {
    var set = Set<Int>()
    let numbers = numbers.map { $0 }
    var visited: [Bool] = Array(repeating: false, count: numbers.count)
    let maxCount = NSDecimalNumber(decimal: pow(10, numbers.count))
    let sosuArr = searchSosu(max: Int(truncating: maxCount))
    
    func dfs(s: String) {
        if s.count == numbers.count {
            return
        }
        
        for i in 0..<numbers.count {
            if visited[i] {
                continue
            }
            visited[i] = true
            let num = Int("\(s)\(numbers[i])")!
            
            if sosuArr[num] == 0 {
                set.update(with: num)
            }
            
            dfs(s: String(num))
            visited[i] = false
        }
    }
    dfs(s: "")
    
    return set.count
}

//solutionP42839_2("17")
//solutionP42839_2("011")
