//
//  2869.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func soultion2869() {
    let input = readLine()!.components(separatedBy: " ")
    let up = Int(input[0])!
    let down = Int(input[1])!
    let V = Int(input[2])!
    
    // 하루에 up - down만큼 올라가고 예외로 당일에 up올라가서 바로 도착하는경우 체크
    let gap = up - down
    let day = (V-up)/gap
    if (V-up)%gap == 0 {
        print(day+1)
    } else {
        print(day+2)
    }
    
}

/*
 func soultion2869() {
     let input = readLine()!.components(separatedBy: " ")
     let up = Int(input[0])!
     let down = Int(input[1])!
     let V = Int(input[2])!
     
     var result = 0
     for i in 1... {
         result += up
         
         if result >= V {
             print(i)
             return
         }
         
         result -= down
     }
 }
 */
