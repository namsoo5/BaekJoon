//
//  1065.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/09.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution1065() {
    
    let n = readLine()!
    
    let num = Int(n)!
    var result = 99
    if num < 100 {
        result = num
    } else {
        for i in 100...num {
            var i = i
            var arr: [Int] = []
            while i > 0 {
                let value = i%10
                i /= 10
                arr.append(value)
            }
            
            if 한수(list: arr) {
                result += 1
            }
        }
    }
    print(result)
}

func 한수(list: [Int]) -> Bool {
    // 2자리까지 자신이 한수
    if list.count < 3 {
        return true
    }
    
    let gap = list[0] - list[1]
    for i in 1..<list.count - 1 {
        let temp = list[i] - list[i+1]
        if temp != gap {
            return false
        }
    }
    
    return true
}


