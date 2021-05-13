//
//  P77485.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 행렬 테두리 회전하기
// 22:30 - 23: 50
private func solutionP77485(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var origin: [[Int]] = (0..<rows).map { row in (1...columns).map { (row*columns) + $0 } }
    
    func rotate(arr: [[Int]], query: [Int]) -> (arr: [[Int]], min: Int) {
        let topRow = query[0] - 1
        let leftCol = query[1] - 1
        let botRow = query[2] - 1
        let rightCol = query[3] - 1
        
        var temp = arr
        var minValue = Int.max
        
        //윗줄
        for c in leftCol..<rightCol {
            let value = arr[topRow][c]
            temp[topRow][c+1] = value
            minValue = min(minValue, value)
        }
        
        //오른줄
        for r in topRow..<botRow {
            let value = arr[r][rightCol]
            temp[r+1][rightCol] = value
            minValue = min(minValue, value)
        }
        
        //아랫줄
        for c in leftCol..<rightCol {
            let value = arr[botRow][c+1]
            temp[botRow][c] = value
            minValue = min(minValue, value)
        }
        
        //왼줄
        for r in topRow..<botRow {
            let value =  arr[r+1][leftCol]
            temp[r][leftCol] = value
            minValue = min(minValue, value)
        }
     
        return (temp, minValue)
    }
    
    var result: [Int] = []
    for query in queries {
        let rotateArr = rotate(arr: origin, query: query)
        origin = rotateArr.arr
        result.append(rotateArr.min)
        
    }
//    print(result)
    return result
}

//solutionP77485(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]])
//solutionP77485(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]])
//solutionP77485(100, 97, [[1,1,100,97]])
