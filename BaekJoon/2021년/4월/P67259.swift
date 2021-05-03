//
//  P67259.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/23.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


// 15:00 - 18:00
// 경주로 건설
// 시간초과..
// true/false개념대신 경로의 최소비용을 저장해놓는 방식으로 최소비용과 비교해서 중복된 곳을 가지않도록 변경
// 14번케이스 방향이상 위아래우좌 순으로 하면 성공하는데 다른케이스 실패함
private func solutionP67259(_ board:[[Int]]) -> Int {
    enum Direct {
        case horizontal, vertical, none
    }
    let n = board.count
    var visited = (0..<n).map { _ in Array(repeating: Int.max, count: n) }
    var minPrice = Int.max
    let pos = (0, 0)
    
    func dfs(curPos: (Int, Int), price: Int, direct: Direct) {
        
        if minPrice <= price {
            return
        }
        if curPos == (n-1,n-1) {
            minPrice = min(minPrice, price)
            return
        }
        
        if curPos.1+1 < n {
            let up = board[curPos.0][curPos.1+1]
            if up == 0 {
                if direct == .horizontal {
                    if visited[curPos.0][curPos.1+1] >= price+600 {
                        visited[curPos.0][curPos.1+1] = price+600
                        dfs(curPos: (curPos.0, curPos.1+1), price: price+600, direct: .vertical)
                    }
                } else {
                    if visited[curPos.0][curPos.1+1] >= price+100 {
                        visited[curPos.0][curPos.1+1] = price+100
                        dfs(curPos: (curPos.0, curPos.1+1), price: price+100, direct: .vertical)
                    }
                }
            }
        }
        
        
        if curPos.1-1 >= 0 {
            let down = board[curPos.0][curPos.1-1]
            if down == 0 {
                if direct == .horizontal {
                    if visited[curPos.0][curPos.1-1] >= price+600 {
                        visited[curPos.0][curPos.1-1] = price+600
                        dfs(curPos: (curPos.0, curPos.1-1), price: price+600, direct: .vertical)
                    }
                } else {
                    if visited[curPos.0][curPos.1-1] >= price+100 {
                        visited[curPos.0][curPos.1-1] = price+100
                        dfs(curPos: (curPos.0, curPos.1-1), price: price+100, direct: .vertical)
                    }
                }
            }
        }
        
        if curPos.0+1 < n {
            let right = board[curPos.0+1][curPos.1]
            if right == 0 {
                if direct == .vertical {
                    if visited[curPos.0+1][curPos.1] >= price+600 {
                        visited[curPos.0+1][curPos.1] = price+600
                        dfs(curPos: (curPos.0+1, curPos.1), price: price+600, direct: .horizontal)
                    }
                } else {
                    if visited[curPos.0+1][curPos.1] >= price+100 {
                        visited[curPos.0+1][curPos.1] = price+100
                        dfs(curPos: (curPos.0+1, curPos.1), price: price+100, direct: .horizontal)
                    }
                }
            }
        }
        
        if curPos.0-1 >= 0 {
            let left = board[curPos.0-1][curPos.1]
            if left == 0 {
                if direct == .vertical {
                    if visited[curPos.0-1][curPos.1] >= price+600 {
                        visited[curPos.0-1][curPos.1] = price+600
                        dfs(curPos: (curPos.0-1, curPos.1), price: price+600, direct: .horizontal)
                    }
                } else {
                    if visited[curPos.0-1][curPos.1] >= price+100 {
                        visited[curPos.0-1][curPos.1] = price+100
                        dfs(curPos: (curPos.0-1, curPos.1), price: price+100, direct: .horizontal)
                    }
                }
            }
        }
    }
    visited[0][0] = 0
    dfs(curPos: pos, price: 0, direct: .none)
    
    return minPrice == Int.max ? 0 : minPrice
}

//solutionP67259([[0,0,0],[0,0,0],[0,0,0]])
//solutionP67259([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]])
//solutionP67259([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]])
//solutionP67259([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]])
//solutionP67259([[1,1,1],[1,1,1],[1,1,1]])

