//
//  4948.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/19.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution4948() {
    let max = 123456 * 2
    let sosuList = searchSosu(max: max)
    var countArr: [Int] = []
    
    while true {
        let num = Int(readLine()!)!
        var count = 0
        
        if num == 0 {
            break
        }
        
        for i in num+1...num*2 {
            if sosuList[i] == 0 {
                count += 1
            }
        }
        countArr.append(count)
    }
    countArr.forEach { print($0) }
    return
}
