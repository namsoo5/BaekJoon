//
//  2021하반기 채널톡.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/20.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution1(_ p: String, _ n: Int) -> String {
    let timeString = p.components(separatedBy: .whitespaces)
    let time = timeString[1].components(separatedBy: ":").compactMap { Int($0) }
    var hour = time[0]
    if timeString[0] == "PM" {
        if hour != 12 {
            hour += 12
        }
    } else if timeString[0] == "AM" {
        if hour == 12 {
            hour -= 12
        }
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
//solution1("AM 11:59:50", 13)
//solution1("AM 12:01:00", 0)
//solution1("PM 12:01:00", 0)


private func solution2(_ text: String) -> String {
    var storage: [String: Int] = [:]
    
    text.forEach {
        if Int("\($0)") != nil {
            return
        }
        let key = $0.uppercased()
        if storage.keys.contains(key) {
            storage[key] = storage[key]! + 1
        } else {
            storage[key] = 1
        }
    }
    
    print(storage)
    let sortedStorage = storage.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }
    
    print(sortedStorage)
    var result = ""
    sortedStorage.forEach {
        result.append("\($0.key)\($0.value)")
    }
    print(result)
    return ""
}
//
//solution2("AABBBAAAAAAAAAAAAA")
//solution2("BBAACCC")
//solution2("AABBaaaaaAAAaa")
//solution2("abcabcaabc123")

private func solution3(_ timeRanges: [String], _ now: String) -> Int {
    let dayOfMinute = 24 * 60
    let daySchedule: [Bool] = [Bool](repeating: false, count: dayOfMinute)
    var weekSchedule: [[Bool]] = [[Bool]](repeating: daySchedule, count: 7)
    
    enum Week: String {
        case mon = "MON"
        case tue = "TUE"
        case wed = "WED"
        case thu = "THU"
        case fri = "FRI"
        case sat = "SAT"
        case sun = "SUN"
        
        var index: Int {
            switch self {
            case .mon: return 0
            case .tue: return 1
            case .wed: return 2
            case .thu: return 3
            case .fri: return 4
            case .sat: return 5
            case .sun: return 6
            }
        }
    }
    
    func convertToMin(time: String) -> Int {
        let time = time.components(separatedBy: ":")
        guard let hour = Int(time[0]), let min = Int(time[1]) else {
            return 0
        }
        return hour * 60 + min
    }
    
    timeRanges.forEach {
        let timeRange = $0.components(separatedBy: .whitespaces)
        guard let week = Week(rawValue: timeRange[0]) else {
            return
        }
        let time = timeRange[1]
        let startToEndTime = time.components(separatedBy: "~")
        let start = startToEndTime[0]
        let end = startToEndTime[1]
        
        let startIndex = convertToMin(time: start)
        let endIndex = convertToMin(time: end)
        
        (startIndex...endIndex).forEach {
            weekSchedule[week.index][$0] = true
        }
    }
    
    let now = now.components(separatedBy: .whitespaces)
    guard let week = Week(rawValue: now[0]) else {
        return 0
    }
    let time = now[1]
    let nowIndex = convertToMin(time: time)
    if weekSchedule[week.index][nowIndex] {
        return 0
    }
    print("now: \(nowIndex)")
    var futureIndex = 0
    // 현재시간 이후로 당일체크
    for timeIndex in nowIndex+1..<dayOfMinute {
        futureIndex += 1
        if weekSchedule[week.index][timeIndex] {
            return futureIndex
        }
    }
    
    print("future: \(futureIndex)")
    
    // 나머지요일체크
    for weekIndex in week.index+1...week.index+7 {
        var weekIndex = weekIndex
        if weekIndex > 6 {
            weekIndex -= 7
        }
        print("week: \(weekIndex)")
        for timeIndex in 0..<dayOfMinute {
            futureIndex += 1
            if weekSchedule[weekIndex][timeIndex] {
                return futureIndex
            }
        }
    }
    
    
    return -1
}

//print(solution3(["WED 12:00~18:00"], "TUE 10:00"))
//print(solution3(["WED 12:00~18:00"], "WED 14:00"))
//print(solution3(["SAT 12:00~18:00"], "SAT 19:00"))
