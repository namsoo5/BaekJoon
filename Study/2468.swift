//
//  2468.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation



private func solution2468() {
    let n = Int(readLine()!)!
    var input: [[Int]] = []
    var maxHeight = 0
    var result = 1
    
    for _ in 0..<n {
        let row = readLine()!.components(separatedBy: " ").map{Int($0)!}
        input.append(row)
        
        row.forEach {
            if maxHeight < $0 {
                maxHeight = $0
            }
        }
    }
    var visited: [[Bool]] = []
    for i in 0..<input.count {
        let row = Array(repeating: false, count: input[i].count)
        visited.append(row)
    }
    
    // 주어진 높이보다 높은경우에만 실행
    func bfs(limit: Int, row: Int, col: Int) {
        
        if row < 0 || row > input[0].count-1 ||
            col < 0 || col > n-1 {
            return
        }
        if visited[row][col] {
            return
        }
        if limit >= input[row][col] {
            return
        }
        visited[row][col] = true
        
        bfs(limit: limit, row: row+1, col: col)
        bfs(limit: limit, row: row, col: col+1)
        bfs(limit: limit, row: row-1, col: col)
        bfs(limit: limit, row: row, col: col-1)
    }
    
    func resetVisited() {
        for i in 0..<visited.count {
            for j in 0..<visited[i].count {
                visited[i][j] = false
            }
        }
    }
    
    for height in 1..<maxHeight {
        var tempResult = 0
        for i in 0..<input.count {
            for j in 0..<input[i].count {
                if visited[i][j] == false && input[i][j] > height {
//                    print("i:\(i), j:\(j)")
                    tempResult += 1
                    bfs(limit: height, row: i, col: j)
                }
            }
        }
//        print("height: \(height), result: \(tempResult)")
        if result < tempResult {
            result = tempResult
        }
        resetVisited()
    }
    
    print(result)
}
// 모든 높이가 1일경우 예외생김(반복문 안돌아감)
// 아무지역도 물에안잠기는경우가 무조건 존재함으로
// 안전지대기본값 1부터시작
