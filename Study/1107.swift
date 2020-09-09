//
//  1107.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution1107() {
    var numSet: [Int] = []
    let n = Int(readLine()!)!
    let _ = readLine()
    let brokenNum = readLine()!.components(separatedBy: .whitespacesAndNewlines).map{Int($0)!}
    
    for i in 0...9 {
        if !brokenNum.contains(i) {
            numSet.append(i)
        }
    }
    
    var disitArr: [Int] = []
    func numDisit(n: Int) {
        var num = n
        while num > 0 {
            let disit = num%10
            disitArr.append(disit)
            num /= 10
        }
    }
    numDisit(n: n)
    disitArr.reverse()
        
    var result = 0
    
    for (i,disit) in disitArr.enumerated() {
        var max = 0
        var min = 9999999
        var found = false
        print("disit \(disit)")
        for num in numSet {
            if disit > num {
                min = num
            } else if disit == num {
                found = true
                if i == 0 {
                    result += disit
                } else {
                    result += disit * 10 * i
                }
            } else if disit < num {
                max = num
                break
            }
        }
//        545 549
        if !found {
            print(result)
            print(max)
            print(min)
        }
        
    }
    
}
