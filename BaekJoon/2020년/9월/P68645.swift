//
//  P68645.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 문제 설명에 따라서 외각을 따라서 대입하려고했으나 규칙이 어려움
// 2차원배열로 쉽게 접근
// 월간 코드챌린지 시즌1 삼각 달팽이
private func solutionP68645(_ n:Int) -> [Int] {
    
    var arr = [Int](repeating: -1, count: n).map{ _ in [Int](repeating: -1, count: n) }
    
    var num = 1
    var i = 0 // 세로위치
    var j = 0 // 가로위치
    var process = 0 // 바퀴수
    
    let lastNum = n*(n+1)/2
    
    while true {
        if num > lastNum || n/3 < process/2 {
            break
        }
        
        // 아래로
        while i < n - process/2 {
            arr[i][j] = num
            num += 1
            i += 1
        }
        i -= 1
        if num > lastNum {
            break
        }
        
        j += 1
        // 오른쪽으로
        while j < n - process {
            arr[i][j] = num
            num += 1
            j += 1
        }
        j -= 1
        if num > lastNum {
            break
        }
        
        i -= 1
        j -= 1
        // 왼쪽대각선위로
        while i > process/2 && j > process/2 {
            arr[i][j] = num
            num += 1
            i -= 1
            j -= 1
        }
        j += 1
        i += 2
        
        process += 2
    }
    
    var result: [Int] = []
    for i in 0..<n {
//        print(arr[i])
        for j in 0..<n {
            let value = arr[i][j]
            if value == -1 {
                continue
            }
            result.append(value)
        }
    }
    
//    print(result)
    return result
}
//
//solutionP68645(6)
//solutionP68645(5)
