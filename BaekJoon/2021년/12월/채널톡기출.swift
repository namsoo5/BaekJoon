//
//  채널톡기출.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 채널톡 예전문제 1
private func solution1(_ p: String, _ n: Int) -> String {
    let timeString = p.components(separatedBy: .whitespaces)
    let time = timeString[1].components(separatedBy: ":").compactMap { Int($0) }
    var hour = time[0]
    if timeString[0] == "PM" {
        hour += 12
    }
    var min = time[1]
    var sec = time[2]
    
    sec += n
    if sec >= 60 {
        min = min + sec/60
        sec %= 60
    }
    
    if min >= 60 {
        hour = hour + min/60
        min %= 60
    }
    
    if hour >= 24 {
        hour = hour % 24
    }
    let hourString = String(format: "%02d", hour)
    let minString = String(format: "%02d", min)
    let secString = String(format: "%02d", sec)
    let answer = "\(hourString):\(minString):\(secString)"
    print(answer)
    return answer
}

//solution1("PM 01:00:00", 10)
//solution1("PM 11:59:59", 1)

/// 채널톡 기출2번
private func solution2(_ road: String, n: Int) -> Int {
    var road = road.map { String($0) }
    var repairIndex: [Int] = []
    var maxDistance = 0
    
    var head = 0
    var n = n
    
    for (i, r) in road.enumerated() {
        if r == "0" {
            n -= 1
            if n < 0 {
                let currentDistance = (i-1) - head + 1
                print("i: \(i), dis: \(currentDistance)")
                maxDistance = max(currentDistance, maxDistance)
                let removeIndex = repairIndex.removeFirst()
                head = removeIndex + 1
            }
            road[i] = "1"
            repairIndex.append(i)
        }
//        print(repairIndex)
    }
    
    if n >= 0 {
        print(road.count)
        return road.count
    }
    
    print(maxDistance)
    return maxDistance
}
//solution2("111011110011111011111100011111", n: 3)
//solution2("001100", n: 5)
//solution2("00010001000", n: 3)
//solution2("001100", n: 2)
//solution2("110110011", n: 2)
