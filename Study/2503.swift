//
//  2503.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/22.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 숫자야구
private func solution2503() {
    let n = Int(readLine()!)!
    var questions: [[Int]] = []
    for _ in 0..<n {
        let q = readLine()!.components(separatedBy: .whitespacesAndNewlines).map{Int($0)!}
        questions.append(q)
    }
    
    var result = 0
    
    for num in 123...999 {
        let head = num/100
        let mid = num/10%10
        let tail = num%10
        
        if head == mid || mid == tail || head == tail ||
            head == 0 || mid == 0 || tail == 0 {
            continue
        }
        
        var skip = false
        // 주어진 질문과 비교
        for element in questions {
            var strike = 0
            var ball = 0
            let h = element[0]/100
            let m = element[0]/10%10
            let t = element[0]%10
            
            if h == head {
                strike += 1
            } else if h == mid || h == tail {
                ball += 1
            }
            
            if m == mid {
                strike += 1
            } else if m == head || m == tail {
                ball += 1
            }
            
            if t == tail {
                strike += 1
            } else if t == mid || t == head {
                ball += 1
            }
            
            // 스트라이크 다른경우 스킵
            if element[1] != strike || element[2] != ball {
                skip = true
                break
            }
            
        }
        if skip {
            continue
        }
        result += 1
    }
    print(result)
}


