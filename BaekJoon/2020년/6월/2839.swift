//
//  2839.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution2839() {
    guard let input = readLine() else {
        return
    }
    let inputNum = Int(input)!
    var count = 0
    
    count = inputNum / 5
    if inputNum % 5 == 0 {
        print(count)
        return
    } else {
        for i in stride(from: count, through: 0, by: -1) {
            let tempNum = inputNum - 5 * i
            if tempNum % 3 == 0 {
                count = tempNum / 3 + i
                print(count)
                return
            }
        }
    }
    
    print("-1")
    
}
