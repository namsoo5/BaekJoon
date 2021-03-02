//
//  P12946.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/02/21.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 하노이의 탑
private func solutionP12946(_ n:Int) -> [[Int]] {
    var result: [[Int]] = []
    
    func hanoi(num: Int, from: Int, by: Int, to: Int) {
        if num == 1 {
            result.append([from,to])
            return
        }
        
        // 1 -> 2 (마지막하나를 빼고 다 두번째 위치로 이동)
        hanoi(num: num-1, from: from, by: to, to: by)
        
        // 1-> 3 (마지막하나를 끝으로 이동)
        result.append([from,to])
        
        // 2 -> 3 (두번째 위치에 놓은것들을 다시 끝으로 이동)
        hanoi(num: num-1, from: by, by: from, to: to)
    }
    hanoi(num: n, from: 1, by: 2, to: 3)
    
    return result
}

//solutionP12946(2)
