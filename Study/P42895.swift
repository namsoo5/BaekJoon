//
//  P42895.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// n으로 표현
// d[i] = (d[i-1] + d[i-2] + d[i-3].... d[1]) * 4
private func solution42895(_ N:Int, _ number:Int) -> Int {
    
    var numSet: [Set<Int>] = Array(repeating: [], count: 9)
    
    func makeRowFirstValue(num: Int, count: Int) -> Int {
        var firstValue = 0
        for _ in 0..<count {
            firstValue = firstValue * 10 + num
        }
        
        return firstValue
    }
    
    for i in 1..<9 { // 최소8번
        let newValue = makeRowFirstValue(num: N, count: i)
        numSet[i].insert(newValue)
        for j in 1..<i {
            for k in 1..<i {  // 5가 j개 (+,-,/,*) 5가 k개
                if j + k == i {
                    print("i: \(i)")
                    print("j: \(j), k: \(k)")
                    for a in numSet[j] {
                        for b in numSet[k] {
                            print("a: \(a), b: \(b)")
                            numSet[i].insert(a+b)
                            numSet[i].insert(a*b)
                            _ = a > b ? numSet[i].insert(a-b) : numSet[i].insert(b-a)
                            if a > 0 {
                                numSet[i].insert(b/a)
                            }
                            if b > 0 {
                                numSet[i].insert(a/b)
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    for (i,set) in numSet.enumerated() {
        if set.contains(number) {
            return i
        }
    }
    return -1
}

//print(solution42895(5, 12))
