//
//  Coupang2020하반기.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/09.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution1(_ N: Int) -> [Int] {

    var maxNum = 0
    var maxIndex = 0
    var n = N
    
    for i in 2...9 {
        n = N
        var tempMulti = 1
        while n > i {
            let num = n/i
            let remain = n%i
            n = num
            if remain != 0 {
                tempMulti *= remain
            }
            if n < i && n != 0 {
                tempMulti *= n
                break
            }
        }
        
        if tempMulti >= maxNum {
            maxNum = tempMulti
            maxIndex = i
        }
    }
    return [maxIndex, maxNum]
}

//solution1(10)
//solution1(14)



private func solution3(_ k: Int, _ score: [Int]) -> Int {
    
    var beforeScore = score[0]
    var scoreDic: [Int: [Int]] = [:]
    var scoreSet = Set<Int>()
    score.indices.forEach { scoreSet.update(with: $0+1) }
    
    for i in 1..<score.count {
        let distance = beforeScore - score[i]
        
        if scoreDic.keys.contains(distance) {
            scoreDic[distance]!.append(i+1)
            scoreDic[distance]!.append(i)
        } else {
            scoreDic[distance] = [i, i+1]
        }
        beforeScore = score[i]
    }
    
    for elements in scoreDic {
        if elements.value.count/2 >= k {
            elements.value.forEach { scoreSet.remove($0) }
        }
    }
    
    
    return scoreSet.count
}

//solution3(3, [24,22,20,10,5,3,2,1])
//solution3(2, [1300000000,700000000,668239490,618239490,568239490,568239486,518239486,157658638,157658634,100000000,100])



private func solution4(_ depar: String, _ hub: String, _ dest: String, _ roads: [[String]]) -> Int {
    
    var roadDic: [String: [String]] = [:]
    var result = 0
    
    for road in roads {
        let start = road[0]
        let arrive = road[1]
        
        if roadDic.keys.contains(start) {
            roadDic[start]!.append(arrive)
        } else {
            roadDic[start] = [arrive]
        }
    }
        
    func dfs(start: String, isHub: Bool) {
        guard let goTo = roadDic[start] else {
            return
        }
        
        for element in goTo {
            var isHub = isHub
            if element == hub {
                isHub = true
            }
            
            if element == dest {
                if isHub {
                    result += 1
                }
            }
            dfs(start: element, isHub: isHub)
        }
    }
    
    guard let starts = roadDic[depar] else {
        return 0
    }
    
    for start in starts {
        dfs(start: start, isHub: false)
    }
    
    return result
}

//solution4("SEOUL", "DAEGU", "YEOSU", [["ULSAN","BUSAN"],
//                                      ["DAEJEON","ULSAN"],
//                                      ["DAEJEON","GWANGJU"],
//                                      ["SEOUL","DAEJEON"],
//                                      ["SEOUL","ULSAN"],
//                                      ["DAEJEON","DAEGU"],
//                                      ["GWANGJU","BUSAN"],
//                                      ["DAEGU","GWANGJU"],
//                                      ["DAEGU","BUSAN"],
//                                      ["ULSAN","DAEGU"],
//                                      ["GWANGJU","YEOSU"],
//                                      ["BUSAN","YEOSU"]])
//
//solution4("ULSAN", "SEOUL", "BUSAN", [["SEOUL","DAEJEON"],
//                                      ["ULSAN","BUSAN"],
//                                      ["DAEJEON","ULSAN"],
//                                      ["DAEJEON","GWANGJU"],
//                                      ["SEOUL","ULSAN"],
//                                      ["DAEJEON","BUSAN"],
//                                      ["GWANGJU","BUSAN"]])


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

//solution2(3, ["10/01 23:20:25 30",
//              "10/01 23:25:50 26",
//              "10/01 23:31:00 05",
//              "10/01 23:33:17 24",
//              "10/01 23:50:25 13",
//              "10/01 23:55:45 20",
//              "10/01 23:59:39 03",
//              "10/02 00:10:00 10"])
//
//solution2(2, ["02/28 23:59:00 03",
//              "03/01 00:00:00 02",
//              "03/01 00:05:00 01"])
//
