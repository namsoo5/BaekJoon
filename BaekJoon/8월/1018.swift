//
//  1018.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/04.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 체스판 다시 칠하기
private func solution1018() {
    let input = readLine()!.components(separatedBy: .whitespaces).map{ Int($0)! }
    let n = input[0], m = input[1]
    
    var chess: [[String]] = Array(repeating: [], count: n)
    
    (0..<n).forEach{ row in
        
        let temp = readLine()!
        temp.forEach{ chess[row].append(String($0)) }
    }
    
    var minCount = 9999999
    func checkChess(x: Int, y: Int) {
        var whiteCount = 0
        var blackCount = 0
        
        for j in y..<y+8 {
            for i in x..<x+8 {
                let curColor = chess[j][i]
               
                if (i%2 == 0 && j%2 == 0) || (i%2 == 1 && j%2 == 1) {
                    // BWBW...
                    if curColor == "W" {
                        blackCount += 1
                    } else {
                        // WBWB...
                        whiteCount += 1
                    }
                } else {
                    if curColor == "B" {
                        blackCount += 1
                    } else {
                        whiteCount += 1
                    }
                }
                
            }
        }
        let minColor = min(whiteCount, blackCount)
        if minCount > minColor {
            minCount = minColor
        }
        
        if x+8 > m-1 && y+8 > n-1 {
            return
        } else if x+8 > m-1 {
            checkChess(x: 0, y: y+1)
            return
        }
        
        checkChess(x: x+1, y: y)
    }
    
    checkChess(x: 0, y: 0)
    print(minCount)
}
