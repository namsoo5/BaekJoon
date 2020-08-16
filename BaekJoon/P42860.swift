//
//  P42860.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/16.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 조이스틱
private func solutionP42860(_ name:String) -> Int {
    let A = 65 //"A".unicodeScalars.first?.value
    let Z = 90
    
    func moveJoystick(char: Character) -> Int {
        let compareValue = char.unicodeScalars.first?.value
        let downCount = Z - Int(compareValue!) + 1
        let upCount = Int(compareValue!) - A
        return min(downCount, upCount)
    }
    
    var count = 0
    for element in name {
        if element == "A" {
            continue
        }
        count += moveJoystick(char: element)
        // ABAAAAAAAAABB케이스에서 중간에 A가 문자열길이보다 많으면 반대로돌기
    }
    
    var maxAcount = 0
    var maxIndex = 999999
    var temp = 0
    name.enumerated().reversed().forEach {
        if $1 == "A" {
            temp += 1
            if maxIndex > $0 {
                maxIndex = $0
            }
        } else {
            if maxAcount < temp {
                maxAcount = temp
                temp = 0
            }
        }
    }
    let backMove = name.count - maxIndex + maxIndex * 2 - maxAcount
    var leftMove = 0
    var aCount = 0
    for element in name {
        if element == "A" {
            aCount += 1
            continue
        }
        leftMove += aCount
        leftMove += 1
        aCount = 0
    }
    var rightMove = 0
    aCount = 0
    for (i,element) in name.enumerated().reversed() {
        if i == 0 {
            break
        }
        if element == "A" {
            aCount += 1
            continue
        }
        rightMove += aCount
        rightMove += 1
        aCount = 0
    }
//    let minMove = min(move, name.count-1)
    
    let minMove = min(rightMove, leftMove, backMove)
    count += minMove
    print(count)
    return count
}
solutionP42860("ABAABB")
solutionP42860("JEROEN")
solutionP42860("JAN")

//solutionP42860("AAAA")
