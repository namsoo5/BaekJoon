//
//  2581.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/17.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution2581() {
    var m = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    let sosuArr = searchSosu(max: 10000)
    var sum = 0
    var min = n
    
    m = m >= 2 ? m : 2
    for i in stride(from: m, through: n, by: 1) {
        if sosuArr[i] == 0 {
            sum += i
            if min > i {
                min = i
            }
        }
    }
    sum = sum == 0 ? -1 : sum
    print(sum)
    if sum == -1 {
        return
    }
    print(min)
}


/*
 func solution2581() {
     var m = Int(readLine()!)!
     let n = Int(readLine()!)!

     var sum = 0
     var min = n
     m = m >= 2 ? m : 2
     
     for i in stride(from: m, through: n, by: 1) {
         var isSosu = true

         for n in 2..<i {
             if i % n == 0 {
                 isSosu = false
                 break
             }
         }
         if isSosu {
             sum += i
             if min > i {
                 min = i
             }
         }
     }
     sum = sum == 0 ? -1 : sum
     print(sum)
     if sum != -1 {
         print(min)
     }
     
 }
 */
