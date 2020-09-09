//
//  4673.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/08.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func d4673(n: Int) -> Int {
    
    var temp = n
    var sum = n
    while true {
        sum += temp%10
        temp /= 10
        
        if temp == 0 {
            break
        }
    }
    return sum
}

private func solution4673() {
    let count = 100
    var list = Array(repeating: 0, count: 10001)
    
    for i in 1...count {
        let index = d4673(n: i)
        if index <= 10000 {
            list[index] = 1
        }
    }
    
    for i in 1..<count {
        if list[i] == 0 {
            print(i)
        }
    }
}
