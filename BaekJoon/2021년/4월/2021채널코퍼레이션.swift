//
//  2021채널코퍼레이션.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution3(_ letters: String, _ k: Int) -> String {
    
    var stack: [Character] = []
    var k = letters.count - k // 삭제가능 횟수
    
    for i in letters.indices {
        let letter = letters[i]
        print(stack)
        
        // 현재 문자보다 작은경우 전꺼 삭제하기
        while !stack.isEmpty && stack.last! < letter && k > 0 {
            stack.removeLast()
            k -= 1
        }
        
        stack.append(letter)
    }
    
    // 삭제가능횟수가 남은경우 뒤에 자르기
    if k > 0 {
        stack.removeLast(k)
    }
    
    print(stack)
    
    return stack.map{String($0)}.joined()
}

//solution3("zbgaj", 3)
//solution3("zaxbyc", 2)

private func solution2(_ road: String, n: Int) -> Int {
    
    let zero = road.filter { $0 == "0" }.count
    if zero <= n {
        return road.count
    }
    
    var oneCount = 0
    var zeroCount = 0
    var oneArr: [Int] = []
    var zeroArr: [Int] = []
    
    if road.first == "0" {
        oneArr.append(0)
        zeroArr.append(0)
    }
    
    for c in road {
        if c == "1" {
            if zeroCount > 0 {
                zeroArr.append(zeroCount)
                oneArr.append(0)
                zeroCount = 0
            }
            oneCount += 1
        } else {
            if oneCount > 0 {
                oneArr.append(oneCount)
                zeroArr.append(0)
                oneCount = 0
            }
            zeroCount += 1
        }
    }
    if oneCount > 0 {
        oneArr.append(oneCount)
        zeroArr.append(0)
        oneCount = 0
    }
    
    
    if zeroCount > 0 {
        zeroArr.append(zeroCount)
        oneArr.append(0)
        zeroCount = 0
    }
    
    if zeroArr.last! != 0 {
        oneArr.append(0)
        zeroArr.append(0)
    }
    
    print(oneArr)
    print(zeroArr)
    
    var max = 0
    var tempN = n
    var dis = 0
    
    // 시작점을 하나씩 옮겨가면서 체크
    for i in 0..<zeroArr.count {
        var head = i
        dis = 0
        
        while head < zeroArr.count {
            if zeroArr[head] == 0 {
                head += 1
                continue
            }
            
            tempN -= zeroArr[head]
            
            // 범위 넘어가면 다른 시작점부터 시작
            if tempN < 0 {
                tempN = n
                break
            }
            
            if dis == 0 {
                dis += oneArr[head-1] + oneArr[head+1]
            } else {
                dis += oneArr[head+1]
            }
            
            if max < dis + n {
                max = dis + n
            }
            
            head += 1
        }
        
    }
    print(max)
    
    return max
}

//solution2("111011110011111011111100011111", n: 3)
//solution2("00010001000", n: 3)
//solution2("001100", n: 5)
//solution2("001100", n: 2)
//solution2("110110011", n: 2)


private func solution1(_ p: String, _ n: Int) -> String {
    
    let clocks = p.components(separatedBy: .whitespaces)
    let apm = clocks[0]
    let clock = clocks[1]
    
    let times = clock.components(separatedBy: ":")
    var hour = times[0]
    let min = times[1]
    let sec = times[2]
    
    var totalSec = 0
    if apm == "AM" {
        if hour == "12" {
            hour = "0"
        }
    } else {
        if hour != "12" {
            totalSec += 12 * 3600
        }
    }
    
    totalSec += Int(hour)! * 3600 + Int(min)! * 60 + Int(sec)!
    totalSec += n
    
    var newHour = totalSec / 3600
    if newHour > 24 {
        newHour %= 24
    }
    newHour = newHour == 24 ? 0 : newHour
    totalSec %= 3600
    
    let newMin = totalSec / 60
    let newSec = totalSec % 60
    
    let newTime = String(format: "%02d:%02d:%02d", newHour,newMin,newSec)
    print(newTime)
    
    return ""
}

//solution1("PM 11:00:00", 3600)
//solution1("PM 11:59:59", 1)
