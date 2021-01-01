//
//  P17676.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 접근방법
// 초 + 분 + 시.. -> ms로 통일
// 도중에겹치는 시간체크 ->
// 문제잘못이해->완료된 시각... 잘확인하기
// 종료순으로 정렬되어있기때문에 다음 element는 현재보다 늦게끝남을 보장받음
// 종료시간을 확인하면서 종료시간+1초 전에시작하는지만 확인하면됌

// 추석 트래픽
private func solutionP17676(_ lines:[String]) -> Int {
    
    var process: [LogData] = []
    
    for line in lines {
        let split = line.components(separatedBy: .whitespaces)
        let dates = split[0].components(separatedBy: "-")
        let year = dates[0]
        let month = dates[1]
        let day = dates[2]
        let time = split[1].components(separatedBy: ":")
        let hour = time[0]
        let min = time[1]
        let sec = time[2]
        let data = LogData(year: year,
                           month: month,
                           day: day,
                           hour: hour,
                           min: min,
                           sec: sec,
                           excute: split[2])
        process.append(data)
    }
    
    var maxCount = 0
    for i in 0..<process.count {
        var count = 1
        let end = process[i].endTime
        for j in i+1..<process.count {
            if process[j].startTime < end + 1000 {
                count += 1
            }
        }
        maxCount = max(count, maxCount)
    }
    
//    print(maxCount)
    return maxCount
}

struct LogData {
    let year: String
    let month: String
    let day: String
    let hour: String
    let min: String
    let sec: String
    var excute: String
    
    var endTime: Double {
        let mhourF = Double(hour)! * 60 * 60 * 1000
        let mminF = Double(min)! * 60 * 1000
        let msecF = Double(sec)! * 1000
        return mhourF + mminF + msecF
    }
    
    var startTime: Double {
        let mhourF = Double(hour)! * 60 * 60 * 1000
        let mminF = Double(min)! * 60 * 1000
        let msecF = Double(sec)! * 1000
        var temp = excute
        temp.removeLast()
        let mExcuteF = Double(temp)! * 1000 - 1
        let mTotal = mhourF + mminF + msecF
        return Double(mTotal - mExcuteF)
    }
}
//
//solutionP17676(["2016-09-15 01:00:04.001 2.0s",
//                "2016-09-15 01:00:07.000 2s"])
//solutionP17676(["2016-09-15 01:00:04.002 2.0s",
//                "2016-09-15 01:00:07.000 2s"])
//solutionP17676([
//    "2016-09-15 20:59:57.421 0.351s",
//    "2016-09-15 20:59:58.233 1.181s",
//    "2016-09-15 20:59:58.299 0.8s",
//    "2016-09-15 20:59:58.688 1.041s",
//    "2016-09-15 20:59:59.591 1.412s",
//    "2016-09-15 21:00:00.464 1.466s",
//    "2016-09-15 21:00:00.741 1.581s",
//    "2016-09-15 21:00:00.748 2.31s",
//    "2016-09-15 21:00:00.966 0.381s",
//    "2016-09-15 21:00:02.066 2.62s"
//    ])

