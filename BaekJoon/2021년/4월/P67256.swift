//
//  P67256.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 키패드 누르기
private func solutionP67256(_ numbers:[Int], _ hand:String) -> String {
    // x,y 좌표
    let zero = (1,0)
    let one = (0,3)
    let two = (1,3)
    let three = (2,3)
    let four = (0,2)
    let five = (1,2)
    let six = (2,2)
    let seven = (0,1)
    let eight = (1,1)
    let nine = (2,1)
    
    let padArr = [zero,one,two,three,four,five,six,seven,eight,nine]
    
    var curLeft = (0,0)
    var curRight = (2,0)
    
    func distance(p1: (Int, Int), p2: (Int, Int)) -> Int {
        abs(p2.0 - p1.0) + abs(p2.1 - p1.1)
    }
    
    var result = ""
    numbers.forEach {
        switch $0 {
        case 1, 4, 7:
            curLeft = padArr[$0]
            result.append("L")
        case 3, 6, 9:
            curRight = padArr[$0]
            result.append("R")
        default:
            let left = distance(p1: padArr[$0], p2: curLeft)
            let right = distance(p1: padArr[$0], p2: curRight)
            if left > right {
                curRight = padArr[$0]
                result.append("R")
            } else if left < right {
                curLeft = padArr[$0]
                result.append("L")
            } else {
                if hand == "right" {
                    curRight = padArr[$0]
                    result.append("R")
                } else {
                    curLeft = padArr[$0]
                    result.append("L")
                }
            }
        }
    }
    
    return result
}

//solutionP67256([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")
