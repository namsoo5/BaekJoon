//
//  9663.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 퀸은 같은줄에 잇을수 없음
// 1줄에 1개의 퀸존재가능
// 대각선 검사하기
// row당1개
// 사간초과...
private func solution9663() {
//     2차원배열을 쓸필요가없음
//     1행에는 1개의 퀸만존재하므로 row[2] = 3 -> 2행 3열에 퀸이존재함을 알릴수있음
    let n = Int(readLine()!)!
    var row = [Int](repeating: -1, count: n+1)
    var count = 0
    
    func isPassible(r: Int) -> Bool {
        for i in 1..<r {
            if row[i] == row[r] {
                return false
            }
            
            // x좌표와 y좌표의 차의 절댓값이 같으면 같은 대각선
            if r-i == abs(row[i]-row[r]) {
                return false
            }
        }
        return true
    }
    
    func dfs(r: Int) {
        if r == n {
            count += 1
            return
        }
        
        for i in 1...n {
            row[r+1] = i
            if isPassible(r: r+1) {
                dfs(r: r+1)
            } else {
                row[r+1] = -1
            }
        }
    }
    
    for i in 1...n {
        row[1] = i
        dfs(r: 1)
    }
    
    print(count)
}
//
//let startTime = CFAbsoluteTimeGetCurrent()
//solution9663()
//
//let endTime = CFAbsoluteTimeGetCurrent() - startTime
//print("\(endTime)s")
