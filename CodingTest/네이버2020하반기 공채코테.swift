//
//  네이버2020하반기 공채코테.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation


private func solution1(_ n: Int, _ p:[Int], _ c:[Int]) -> String {
    
    var remain = 0
    var price = 100
    var result = 0
    var day = 0
    var fail = 0
    
    for i in p.indices {
        remain += p[i]
        day += 1
        
        if remain < c[i] {
            price /= 2
            fail += 1
            if fail == 3 {
                break
            }
        } else {
            remain -= c[i]
            result += c[i] * price
            price = 100
            fail = 0
        }
        
    }
    
    return String(format: "%.02f", Double(result/day))
}
//
//print(solution1(6, [5, 4, 7, 2, 0, 6]    , [4, 6, 4, 9, 2, 3]))
//print(solution1(7, [6, 2, 1, 0, 2, 4, 3], [3, 6, 6, 2, 3, 7, 6]))


private func solution3(_ k:Int) -> Int64 {
    
    let num = [6,2,5,5,4,5,6,3,7,6]
    var result = 0
    
    
    func dfs(temp: Int) {
        if temp < 2 {
            return
        }
        
        for i in num.indices {
            if temp - num[i] > 0 {
                dfs(temp: temp - num[i])
            } else if temp - num[i] == 0 {
                result += 1
            }
        }
    }
    
    if k == 6 {
        result += 1
    }
    
    for i in 1..<num.count {
        if k - num[i] > 0 {
            dfs(temp: k - num[i])
        } else if k - num[i] == 0 {
            result += 1
        }
    }
    
    return Int64(result)
}
//
//solution3(5)
//solution3(6)
//solution3(1)
//solution3(11)
