//
//  1021.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution1021() {
    let firstInput = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    let n = firstInput[0], m = firstInput[1]
    var count = 0
    
    let wantPosition = readLine()!.components(separatedBy: " ").compactMap{ Int($0) }
    
    var queue: [Int] = []
    for i in 1..<n+1 {
        queue.append(i)
    }
    
    var i = 0
    
    while true {
        if i == m {
            break
        }
        let num = queue.first!
        if num ==  wantPosition[i] {
            queue.removeFirst()
            i += 1
            continue
        }
        
        var pos = 0
        for (index, num) in queue.enumerated() {
            if num == wantPosition[i] {
                pos = index
                break
            }
        }
        let tail = queue.count - pos
        let head = pos
        
        if head < tail {
            let temp = queue.removeFirst()
            queue.append(temp)
            count += 1
        } else {
            let temp = queue.removeLast()
            queue.insert(temp, at: 0)
            count += 1
        }
        
    }
    
    print(count)
}



/*

 let queueCount = n
 var queueFirstNum = 1
 var queueLastNum = n
 
 var i = 0
 while true {
     
     print("--------")
     print("want - \(wantPosition[i])")
     print("queueFirstNum \(queueFirstNum)")
     print("queueLastNum \(queueLastNum)")
     print("count \(count)")
     if wantPosition[i] == queueFirstNum {
         queueFirstNum = wantPosition[i] + 1 > n ? 1 : wantPosition[i] + 1
         
     } else {
         //16.. 11 ..15
         let headDistance = wantPosition[i] < queueFirstNum ?
             queueCount - queueFirstNum + wantPosition[i] :
             wantPosition[i] - queueFirstNum
         // 3.. 9 ..1
         let tailDistance = wantPosition[i] > queueLastNum ?
             queueCount - wantPosition[i] + queueLastNum + 1 :
             queueLastNum - wantPosition[i] + 1
         
         if abs(headDistance) < abs(tailDistance) {
             print("왼쪽으로")
             print(headDistance)
             print("-----")
             count += headDistance
             
         } else {
             print("오른으로")
             print(tailDistance)
             print("-----")
             count += tailDistance
         }
         queueFirstNum = wantPosition[i]
         queueLastNum = wantPosition[i] - 1 < 1 ? n : wantPosition[i] - 1
     }
     
     i += 1
     if i == m {
         break
     }
     
 }
 
 */
