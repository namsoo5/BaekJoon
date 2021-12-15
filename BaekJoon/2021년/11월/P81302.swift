//
//  P81302.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/19.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 거리두기 확인하기
 private func solutionP81302(_ places:[[String]]) -> [Int] {
    
    func printArr(_ arr: [[String]]) {
        print("---arr---")
        for e in arr {
            print(e)
        }
    }
    
    var result: [Int] = []
    for place in places {
        let arr: [[String]] = place.map { $0.map { String($0) }}
        printArr(arr)
        result.append(distance(arr) ? 1 : 0)
    }
    
    enum CheckType: String {
        case people = "P"
        case table = "O"
        case partition = "X"
    }
    
    /// 거리두기시 true
    func distance(_ arr: [[String]]) -> Bool {
        for r in 0..<5 {
            for c in 0..<5 {
                if !checkCalculate(arr: arr, r: r, c: c) {
                    return false
                }
            }
        }
        return true
    }
    
    /// 거리두기시 true
     func checkCalculate(arr: [[String]], r: Int, c: Int) -> Bool {
         // MARK: 현재지점기준으로 4크기의 사각형 검사
         if r < arr.count - 1  && c < arr.count - 1 {
             let current = CheckType(rawValue: arr[r][c])!
             let right = CheckType(rawValue: arr[r][c+1])!
             let bottom = CheckType(rawValue: arr[r+1][c])!
             let rightBottom = CheckType(rawValue: arr[r+1][c+1])!
             //        print("check: r:\(r) c:\(c) Value: \(current)")
             
             var peopleCount = 0
             var tableCount = 0
             let area: [CheckType] = [current, right, bottom, rightBottom]
             area.forEach {
                 if $0 == .people {
                     peopleCount += 1
                 } else if $0 == .table {
                     tableCount += 1
                 }
             }
             
             // 현재지점기준으로 4크기의 사각형안에 P2개일떄 O하나라도 있으면 안됌
             if peopleCount >= 2 && tableCount > 0 {
                 return false
             }
         }
         
         // MARK: 오른쪽 2칸검사
         if c < arr.count - 2 {
             let current = CheckType(rawValue: arr[r][c])!
             let right = CheckType(rawValue: arr[r][c+1])!
             let doubleRight = CheckType(rawValue: arr[r][c+2])!
             let area = [current, right, doubleRight]
             
             var continuePeople = false
             for element in area {
                 if element == .people {
                     if continuePeople {
                         return false
                     } else {
                         continuePeople = true
                     }
                 } else if element == .partition {
                     continuePeople = false
                 }
             }
         }
         
         // MARK: 아래 2칸검사
         if r < arr.count - 2 {
             let current = CheckType(rawValue: arr[r][c])!
             let bottom = CheckType(rawValue: arr[r+1][c])!
             let doubleBottom = CheckType(rawValue: arr[r+2][c])!
             let area = [current, bottom, doubleBottom]
             
             var continuePeople = false
             for element in area {
                 if element == .people {
                     if continuePeople {
                         return false
                     } else {
                         continuePeople = true
                     }
                 } else if element == .partition {
                     continuePeople = false
                 }
             }
         }
         
         return true
     }
        
    print(result)
    return result
}

// p: 응시자 o: 테이블 x: 파티션
//solutionP81302([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"],
//                ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
//                ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"],
//                ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
//                ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])
