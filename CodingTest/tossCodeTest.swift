//
//  tossCodeTest.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/01.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
/*
 5번

 func read() -> [(String, String)] {
     let n = Int(readLine()!)!
     var dependencies = [(String, String)](repeating: ("", ""), count: n)
     for i in 0..<n {
         let inputs = readLine()!.components(separatedBy: " ")
         dependencies[i] = (String(inputs[0]), String(inputs[1]))
     }
     return dependencies
 }

 func write(_ validity: Bool) {
     print(validity)
 }

 let testcase = Int(readLine()!)!
 (0..<testcase).forEach { _ in write(solve(read())) }

 /// 지원자가 작성해야하는 메쏘드.
 ///
 /// - Parameter dependencies: 프로젝트간 의존관계가 `Array` 형태로 주어진다.
 /// - Returns: 프로젝트의 의존관계가 올바른지 판단한 결과를 `Bool` 형태로 반환한다.
 func solve(_ dependencies: [(String, String)]) -> Bool {
     
     var di: [String: [String]] = [:]
     
     for (parent, child) in dependencies {
         if di.keys.contains(parent) {
             
             di[parent]!.append(child)
             
             var isFail = false
             if di.keys.contains(child) {
                 di[child]!.forEach {
                     if $0 == parent {
                         isFail = true
                     }
                 }
             }
             if isFail {
                 return false
             }
         } else {
             di[parent] = [child]
             
             var isFail = false
             if di.keys.contains(child) {
                 di[child]!.forEach {
                     if $0 == parent {
                         isFail = true
                     }
                 }
             }
             if isFail {
                 return false
             }
         }
         
     }
     
     return true
 }


 */
/*
 4번
write(solve(read()))
 struct History {
         let date: String
         let usage: Int64
 }

 func read() -> [History] {
     let n = Int(readLine()!)!
     return (0..<n).map { _ in
         let data = readLine()!.split(separator: " ")
         return History(date: String(data[0]), usage: Int64(data[1])!)
     }
 }

 func write(_ output: Int64) {
     print(output)
 }


 func solve(_ history: [History]) -> Int64 {
     var monthMoney: [String: Int64] = [:]
     
     history.forEach {
         let startIndex = $0.date.startIndex
         let monthIndex = $0.date.index(startIndex, offsetBy: 6)
 //        let monthIndex = $0.date.index(yearIndex, offsetBy: 2)
         
         let month = String($0.date[startIndex..<monthIndex])
 //        let month = $0.date[yearIndex..<monthIndex]
         
         if monthMoney.keys.contains(month) {
             monthMoney[month] = monthMoney[month]! + $0.usage
         } else {
             monthMoney[month] = $0.usage
         }
     }
     
     var result = 0.0
     monthMoney.keys.forEach {
         var watt = Int(monthMoney[$0]!)
         
         if watt > 300 {
             result += 2500
         } else if watt > 200 {
             result += 1250
         } else if watt > 100 {
             result += 620
         } else {
             result += 310
         }
         
         while watt > 0 {
             if watt > 300 {
                 result += Double(watt-300) * 308.0
                 watt = 300
             } else if watt > 200 {
                 result += Double(watt-200) * 180.10
                 watt = 200
             } else if watt > 100 {
                 result += Double(watt-100) * 100.90
                 watt = 100
             } else {
                 if 50 < watt {
                     result += Double(watt-50) * 75.50
                     watt = 50
                 } else {
                     result += Double(watt) * 30.50
                     watt = 0
                     break
                 }
             }
         }
     }
     
     return Int64(result.rounded(.up))
 }
 */
/*
 3번

 func read() -> (Int, [(Int, UInt32)]) {
     let firstLine = readLine()!.split(separator: " ")
     let (t, n) = (Int(firstLine[0])!, Int(firstLine[1])!)
     let data: [(Int, UInt32)] = (0..<t).map { index -> (Int, UInt32) in
         let data = readLine()!.split(separator: " ")
         return (Int(data[0])!, UInt32(data[1])!)
     }
     return (n, data)
 }

 func write(_ result: [(String, UInt64)]) {
     for item in result {
         print("\(item.0) \(item.1)")
     }
 }

 /// - Parameters
 ///   - n: 자신을 포함한 친구수
 ///   - history: 친구번호와 사용한 금액의 튜플 (자신의 친구번호는 0이다.)
 /// - Returns
 ///   돈을 보내야하는지 받아야하는지 여부와, 금액의 튜플
 ///   - String: 자신이 송금하는 경우 "send", 받아야하는 경우 "receive"
 ///   - UInt64: 금액
 func solve(_ args: (Int, [(Int, UInt32)])) -> [(String, UInt64)] {
     let (n, history) = args
     
     var sum = 0
     var info: [Int: Int] = [:]
     history.forEach {
         sum += Int($0.1)
         if info.keys.contains($0.0) {
             info[$0.0] = info[$0.0]! + Int($0.1)
         } else {
             info[$0.0] = Int($0.1)
         }
     }
     
     var result: [(String, UInt64)] = []
     let average: Double = (Double(sum)/Double(n))
     for i in 1..<n {
         let money: Double = average - Double(info[i]!)
         if money > 0 {
             result.append(("receive", UInt64(money)))
         } else if money < 0 {
             result.append(("send", UInt64(-money)))
         } else {
             result.append(("none", UInt64(0)))
         }
     }
     
     return result
 }

 write(solve(read()))
 */
/*
2번
 struct UserInfo {
     let phoneNumber: String
     let sixDigitBirthday: String
 }

 func read() -> (userInfo: UserInfo, passwords: [String]) {
     let phoneNumber = readLine()!
     let sixDigitBirthday = readLine()!
     let userInfo: UserInfo = UserInfo(phoneNumber: phoneNumber, sixDigitBirthday: sixDigitBirthday)
     let n = Int(readLine()!)!
     let passwords: [String] = (0..<n).map { _ -> String in
         return readLine()!
     }
     return (userInfo: userInfo, passwords: passwords)
 }

 func write(_ results: [Bool]) {
     results.forEach {
         print($0)
     }
 }

 write(solve(read()))

 /// 비밀번호 검증
 ///
 /// - Parameters
 ///   - userInfo: 사용자의 정보
 ///   - passwords: 안전한지 확인할 비밀번호 목록
 /// - Returns: 비밀번호 각각이 안전한 비밀번호인지 유무
 func solve(_ input: (userInfo: UserInfo, passwords: [String])) -> [Bool] {
     let phone = input.userInfo.phoneNumber.components(separatedBy: "-")
     let phoneNumber: [String] = [phone[1], phone[2]]
     let registrationNum = input.userInfo.sixDigitBirthday
     
     func isValid(pw: String) -> Bool {
         if pw.count != 4 {
             return false
         }
         
         for num in phoneNumber {
             if num == pw {
                 return false
             }
         }
         
         if registrationNum.contains(pw) {
             return false
         }
         
         var sameCount = 1
         var sameNum: String = ""
         pw.forEach {
             if sameNum == String($0) {
                 sameCount += 1
             } else {
                 sameCount = 1
                 sameNum = String($0)
             }
         }
         if sameCount >= 3 {
             return false
         }
       
         var pwNum = Int(pw)!
         let firstNum = pwNum/1000
         pwNum /= 100
         let secondNum = pwNum%10
         let noString1 = "\(firstNum)\(firstNum+1)\(firstNum+2)"
         let noString2 = "\(secondNum)\(secondNum+1)\(secondNum+2)"
         if pw.contains(noString1) || pw.contains(noString2) {
             if noString1.contains("0") || noString2.contains("0") {
                 return true
             }
             return false
         }
         
         let noString3 = "\(firstNum)\(firstNum-1)\(firstNum-2)"
         let noString4 = "\(secondNum)\(secondNum-1)\(secondNum-2)"
         if pw.contains(noString3) || pw.contains(noString4) {
             if noString3.contains("0") || noString4.contains("0") {
                 return true
             }
             return false
         }
         
        return true
         
     }
     
     var result: [Bool] = []
     input.passwords.forEach {
         result.append(isValid(pw: $0))
     }
     
     return result
 }





 */



/*
private func toss1() {

    /// 거래시간 ("yyyy-MM-dd'T'HH:mm:ss") 과 거래금액.
    typealias Transaction = (String, Int32)

    /// 날짜 (yyyy-MM-dd) 와 해당 날짜 거래내역의 총 합.
    typealias DailyTransaction = (String, Int64)


    func read() -> [Transaction] {
        let n = Int(readLine()!)!
        var transactions = [Transaction](repeating: ("", 0), count: n)
        for index in 0..<n {
            let fragments = readLine()!.split(separator: " ")
            let date = String(fragments[0])
            let amount = Int32(fragments[1])!
            transactions[index] = (date, amount)
        }
        return transactions
    }

    func write(_ dailyTransactions: [DailyTransaction]) {
        dailyTransactions.forEach {
            print("\($0) \($1)")
        }
    }
    func solve1(_ transactions: [Transaction]) -> [DailyTransaction] {
        
        var result: [DailyTransaction] = []
        var dataSet: [String: Int64] = [:]
        transactions.forEach {
            let date = $0.0.components(separatedBy: "T")
            if dataSet.keys.contains(date[0]) {
                let money = dataSet[date[0]]! + Int64($0.1)
                dataSet[date[0]] = money
            } else {
                dataSet[date[0]] = Int64($0.1)
            }
        }
        
        dataSet.keys.forEach {
            let info = dataSet[$0]
            let data = DailyTransaction($0, info!)
            result.append(data)
        }
        
        let sortArr = result.sorted{$0.0 > $1.0}
        return sortArr
    }

    write(solve(read()))

}
*/
