//
//  9020.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/22.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution9020() {
    let limit = 10000
    let sosuList = searchSosu(max: limit)
    
    let T = Int(readLine()!)!
    var resultArr: [String] = []
    for _ in 0..<T {
        
        let input = Int(readLine()!)!
        
        for i in input/2..<input {
            if sosuList[i] == 1 {
                continue
            }
            
            let two = input - i
            if sosuList[two] == 1 {
                continue
            }
            resultArr.append("\(two) \(i)")
            break
        }
    }
    
    resultArr.forEach{ print($0) }
}
