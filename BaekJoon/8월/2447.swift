//
//  2447.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/03.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 별 찍기 - 10

private func solution2447() {
    let num = Int(readLine()!)!
    
    let array: [String] = Array(repeating: " ", count: num)
    var starArr: [[String]] = Array(repeating: array, count: num)
    
    
    func starPrint(x: Int, y: Int, n: Int) {
        if n == 1 {
            print("x: \(x) y: \(y) n: \(n)")
            starArr[x][y] = "*"
            return
        }
        
        for i in 0..<3 {
            for j in 0..<3 {
                if j == 1 && i == 1 {
                    continue
                } else {
                    starPrint(x: x+(n/3*j), y: y+(n/3*i), n: n/3)
                }
            }
        }
        
    }
    
    starPrint(x: 0, y: 0, n: num)
    for element in starArr {
        var star = ""
        element.forEach { star.append($0) }
        print(star)
    }
}

