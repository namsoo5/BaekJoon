//
//  P64061.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/23.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 크레인 인형뽑기

private func solution64061(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var outStack: [Int] = []
    var board = board
    var removeCount = 0
    
    for move in moves {
        removeCount += out(board: &board, column: move-1, outStack: &outStack)
    }
    
    return removeCount
}

private func out(board: inout [[Int]], column: Int, outStack: inout [Int]) -> Int {
    var removeCount = 0
    for i in 0..<board.count {
        if board[i][column] == 0 {
            continue
        } else {
            let num = board[i][column]
            removeCount += checkElement(outStack: &outStack, num: num)
            board[i][column] = 0
            break
        }
    }
    return removeCount
}

private func checkElement(outStack: inout [Int], num: Int) -> Int {
    if outStack.isEmpty {
        outStack.append(num)
        return 0
    }
    
    let index = outStack.count - 1
    if outStack[index] == num {
        outStack.removeLast()
        return 2
    } else {
        outStack.append(num)
        return 0
    }
    
}


//print(solution64061([[0,0,0,0,0],
//                     [0,0,1,0,3],
//                     [0,2,5,0,1],
//                     [4,2,4,4,2],
//                     [3,5,1,3,1]],
//                    [1,5,3,5,1,2,1,4]))
