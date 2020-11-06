//
//  P17679.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/25.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 사라진 부분 채우는 로직에 예외가 있어서 오류
// 기존 스왑이아닌 그 열에 해당하는 빈곳을 모두 채워야하기때문에
// 전체를 이동시키는 로직으로 구현

// 프렌즈 4블록
private func solutionP17679(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var newBoard: [[Character]] = []
    var removeIndex: [(i: Int, j: Int)] = []
    var isFinish = true
    var result = 0
    
    for s in board {
        newBoard.append(s.map{ $0 })
    }
    
    while true {
        removeIndex.removeAll()
        isFinish = true
        
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let origin = newBoard[i][j]
                if origin == "0" {
                    continue
                }
                
                if origin == newBoard[i][j+1] &&
                    newBoard[i][j+1] == newBoard[i+1][j] &&
                    newBoard[i+1][j] == newBoard[i+1][j+1] {
                    removeIndex.append((i,j))
                    isFinish = false
                }
            }
        }
        
        for (i,j) in removeIndex {
            if newBoard[i][j] != "0" {
                result += 1
                newBoard[i][j] = "0"
            }
            if newBoard[i][j+1] != "0" {
                result += 1
                newBoard[i][j+1] = "0"
            }
            if newBoard[i+1][j] != "0" {
                result += 1
                newBoard[i+1][j] = "0"
            }
            if newBoard[i+1][j+1] != "0" {
                result += 1
                newBoard[i+1][j+1] = "0"
            }
        }
        
        for j in 0..<n {
            for i in 1..<m {
                if newBoard[i][j] == "0" {
                    for k in stride(from: i, to: 0, by: -1) {
                        let temp = newBoard[k][j]
                        newBoard[k][j] = newBoard[k-1][j]
                        newBoard[k-1][j] = temp
                    }
                }
            }
        }
        
        if isFinish {
            break
        }
    }
    
//    newBoard.forEach { print($0) }
//    print(result)
    return result
}

//solutionP17679(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"])
//solutionP17679(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])
//solutionP17679(4, 5, ["AAAAA","AUUUA","AUUAA","AAAAA"])
//solutionP17679(4, 4, ["ABCD","BACE","BCDD","BCDD"])
