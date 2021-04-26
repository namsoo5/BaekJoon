//
//  P17682.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/20.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 다트 게임
// 18:30 - 18:45
private func solutionP17682(_ dartResult:String) -> Int {
    var result: [Int] = Array(repeating: 0, count: 3)
    
    var num = ""
    var curIndex = 0
    var isNext = false
    dartResult.forEach {
        if Int(String($0)) != nil {
            if isNext {
                curIndex += 1
                num = ""
                isNext = false
            }
            
            num.append($0)
        } else {
            isNext = true
            switch $0 {
            case "S":
                result[curIndex] += Int(num)!
            case "D":
                result[curIndex] += Int(pow(Double(num)!, 2))
            case "T":
                result[curIndex] += Int(pow(Double(num)!, 3))
            case "*":
                for i in curIndex-1...curIndex {
                    if i < 0 {
                        continue
                    }
                    result[i] *= 2
                }
            case "#":
                result[curIndex] = -result[curIndex]
            default:
                break
            }
        }
    }
    
    let sum = result.reduce(0){ $0 + $1 }
//    print(sum)
    return sum
}

//solutionP17682("1S2D*3T")
//solutionP17682("1D2S#10S")
//solutionP17682("1D2S0T")
//solutionP17682("1S*2T*3S")
//solutionP17682("1D#2S*3S")
//solutionP17682("1T2D3D#")
//solutionP17682("1D2S3T*")
