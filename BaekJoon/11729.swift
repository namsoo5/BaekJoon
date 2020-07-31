//
//  11729.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/31.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 하노이탑
private func solution11729() {
    let n = Int(readLine()!)!

    func hanoi(num: Int, from: Int, by: Int, to: Int) {
        if num == 1 {
            print("\(from) \(to)")
            return
        }
        // A 에서 B를 거쳐 C로 이동해야함
        // n-1개 A -> B로
        hanoi(num: num-1, from: from, by: to, to: by)
        // 마지막원판 A -> C로
        print("\(from) \(to)")
        // n-1개 B -> C로
        hanoi(num: num-1, from: by, by: from, to: to)
        
    }
    
    
    print(pow(2, n) - 1)
    hanoi(num: n, from: 1, by: 2, to: 3)
    
}
solution11729()
