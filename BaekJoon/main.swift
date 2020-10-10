//
//  main.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/08.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution2(_ n: Int, _ customers: [String]) -> Int {
    
    var kiosk = [String](repeating: "", count: n+1)
    var result: [Int: Int] = [:]
    
    func afterTime(date: String, time: String, use: String) -> String {
        
        let tempDate = date.components(separatedBy: "/")
        var month = Int(tempDate[0])!
        var day = Int(tempDate[1])!
        
        let tempTime = time.components(separatedBy: ":")
        var hour = Int(tempTime[0])!
        var min = Int(tempTime[1])!
        let sec = tempTime[2]
        
        min += Int(use)!
        
        if min >= 60 {
            min %= 60
            hour += 1
            
            if hour >= 24 {
                hour %= 24
                day += 1
                
                if month == 2 {
                    if day >= 28 {
                        day %= 28
                        month += 1
                    }
                } else {
                    if day >= 31 {
                        day %= 31
                        month += 1
                    }
                }
                
            }
        }
        
        let newTime = "\(String(format: "%02d", month))/\(String(format: "%02d", day)) \(String(format: "%02d", hour)):\(String(format: "%02d", min)):\(sec)"
        return newTime
    }
    
    var processCount = 0
    
    for customer in customers {
        let tempString = customer.components(separatedBy: .whitespaces)
        let date = tempString[0]
        let time = tempString[1]
        let useTime = tempString[2]
        let startTime = "\(date) \(time)"
        
        var index = 1
        while kiosk.count > 0 && index <= n {
            print(kiosk[index] )
            if kiosk[index] != "" && kiosk[index] >= startTime {
                kiosk[index] = ""
                processCount -= 1
            }
            index += 1
        }
        
        if processCount < n {
            let finishTime = afterTime(date: date, time: time, use: useTime)
            for i in 1...n {
                if kiosk[i] == "" {
                    kiosk[i] = finishTime
                    processCount += 1
                    if result.keys.contains(i) {
                        result[i]! += 1
                    } else {
                        result[i] = 1
                    }
                    break
                }
            }
        } else {
            var soonFinish = 1
            var minTime = kiosk[1]
            for i in 2...n {
                if minTime > kiosk[i] {
                    minTime = kiosk[i]
                    soonFinish = i
                }
            }
            let temp = minTime.components(separatedBy: .whitespaces)
            let tempDate = temp[0]
            let tempTime = temp[1]
            let finishTime = afterTime(date: tempDate, time: tempTime, use: useTime)
            kiosk[soonFinish] = finishTime
            
            if result.keys.contains(soonFinish) {
                result[soonFinish]! += 1
            } else {
                result[soonFinish] = 1
            }
        }
    }
    print(result)
    return 0
}

solution2(3, ["10/01 23:20:25 30",
              "10/01 23:25:50 26",
              "10/01 23:31:00 05",
              "10/01 23:33:17 24",
              "10/01 23:50:25 13",
              "10/01 23:55:45 20",
              "10/01 23:59:39 03",
              "10/02 00:10:00 10"])
//
//solution2(2, ["02/28 23:59:00 03",
//              "03/01 00:00:00 02",
//              "03/01 00:05:00 01"])
//
