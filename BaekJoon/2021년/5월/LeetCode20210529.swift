//
//  LeetCode20210529.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/29.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func totalNQueens(_ n: Int) -> Int {
    var board: [[String]] = (0..<n).map { _ in Array(repeating: ".", count: n) }
    
    func checkQueen(r: Int, c: Int, board: [[String]]) -> Bool {
        // 해당 행에 포함되어있는지
        if board[r].contains("Q") {
            return false
        }
        
        for i in 0...c {
            var isQueen = false
            // 왼쪽아래
            if r+i < n {
                if board[r+i][c-i] == "Q" {
                    isQueen = true
                }
            }
            //왼쪽위
            if r-i >= 0 {
                if board[r-i][c-i] == "Q" {
                    isQueen = true
                }
            }
            
            if isQueen {
                return false
            }
        }
        
        return true
    }
    
    var result = 0
    func queen(c: Int, board: [[String]], count: Int) {
        if c == n {
            result += 1
            return
        }
        
        var board = board
        for r in 0..<n {
            if checkQueen(r: r, c: c, board: board) {
                board[r][c] = "Q"
                queen(c: c+1, board: board, count: count+1)
                board[r][c] = "."
            }
        }
    }
    

    for r in 0..<n {
        board[r][0] = "Q"
        queen(c: 1, board: board, count: 1)
        board[r][0] = "."
    }
    
    print(result)
    return result
}
//
//totalNQueens(4)
//totalNQueens(1)
