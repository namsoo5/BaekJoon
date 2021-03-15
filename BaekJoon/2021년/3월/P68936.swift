//
//  P68936.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 쿼드 압축 후 개수 세기
private func solutionP68936(_ arr:[[Int]]) -> [Int] {
   var isZip = arr.map { _ in Array(repeating: false, count: arr.count) }
   var zeroCount = 0
   var oneCount = 0
   
   // 해당 범위를 순회 모든 값이 같으면 압축
   func search(row: Range<Int>, col: Range<Int>) -> Bool {
       
       let first = arr[row.first!][col.first!]
       for i in row {
           for j in col {
               if isZip[i][j] {
                   return false
               }
               if first != arr[i][j] {
                   return false
               }
           }
       }
       
       if first == 0 {
           zeroCount += 1
       } else {
           oneCount += 1
       }
       excuteZip(row: row, col: col)
       return true
   }
   
   // 압축 플레그 표시
   func excuteZip(row: Range<Int>, col: Range<Int>) {
       
       if row.count == 1 || col.count == 1 {
           return
       }
       for i in row {
           for j in col {
               isZip[i][j] = true
           }
       }
   }
   
   func areaZip(sr: Int, sc: Int, er: Int, ec: Int) {
       // 현재 자신 탐색
       if search(row: sr..<er, col: sc..<ec) {
           return
       }
       
       let midr = (sr + er) / 2
       let midc = (sc + ec) / 2
       if midr == sr || midc == sc {
           return
       }
      
       let leftTop = (sr..<midr, sc..<midc)
       let rightTop = (sr..<midr, midc..<ec)
       let leftBottom = (midr..<er, sc..<midc)
       let rightBottom = (midr..<er, midc..<ec)
       
       if !search(row: leftTop.0, col: leftTop.1) {
           areaZip(sr: sr, sc: sc, er: midr, ec: midc)
       }
       
       if !search(row: rightTop.0, col: rightTop.1) {
           areaZip(sr: sr, sc: midc, er: midr, ec: ec)
       }
       
       if !search(row: leftBottom.0, col: leftBottom.1) {
           areaZip(sr: midr, sc: sc, er: er, ec: midc)
       }
       
       if !search(row: rightBottom.0, col: rightBottom.1) {
           areaZip(sr: midr, sc: midc, er: er, ec: ec)
       }
   }
  
   areaZip(sr: 0, sc: 0, er: arr.count, ec: arr.count)
   
   print([zeroCount,oneCount])
   return [zeroCount,oneCount]
}

//solutionP68936([[1,1,0,0],
//                [1,0,0,0],
//                [1,0,0,1],
//                [1,1,1,1]])
//solutionP68936([[1,1,1,1,1,1,1,1],
//                [0,1,1,1,1,1,1,1],
//                [0,0,0,0,1,1,1,1],
//                [0,1,0,0,1,1,1,1],
//                [0,0,0,0,0,0,1,1],
//                [0,0,0,0,0,0,0,1],
//                [0,0,0,0,1,0,0,1],
//                [0,0,0,0,1,1,1,1]])
//
//solutionP68936([[1]])
//
//solutionP68936([[1,1,1,1],
//               [1,1,1,1],
//               [1,1,1,1],
//               [1,1,1,1]])
//
