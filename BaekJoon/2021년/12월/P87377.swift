//
//  P87377.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/12.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
/// 교점에 별 만들기
private func solutionP87377(_ line:[[Int]]) -> [String] {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    
    func cross(a: [Int], b: [Int]) -> Position? {
        let x1 = Double(a[0])
        let y1 = Double(a[1])
        let num1 = Double(a[2])
        let x2 = Double(b[0])
        let y2 = Double(b[1])
        let num2 = Double(b[2])
        
        // 분모 0 이면 무시
        if (x1*y2 - y1*x2) == 0 {
            return nil
        }
        
        let x = (y1*num2 - num1*y2) / (x1*y2 - y1*x2)
        let y = (num1*x2 - x1*num2) / (x1*y2 - y1*x2)
        
        /// 정수가아니면 반환x
        if x.truncatingRemainder(dividingBy: 1) != 0 || y.truncatingRemainder(dividingBy: 1) != 0 {
            return nil
        }
        
        return Position(x: Int(x), y: Int(y))
    }
    
    // 접점 좌표구하기
    var result: [Position] = []
    for i in 0..<line.count {
        for j in i+1..<line.count {
            let a = line[i]
            let b = line[j]
            if let arr = cross(a: a, b: b) {
                result.append(arr)
            }
        }
    }
    
//    result.forEach { print($0) }
    // 최소와 최대위치를 이용해서 점찍을 위치구하기
    let maxX = result.max { $0.x < $1.x }!.x
    let minX = result.min { $0.x < $1.x }!.x
    let maxY = result.max { $0.y < $1.y }!.y
    let minY = result.min { $0.y < $1.y }!.y
    
    let dots = (minX...maxX).map { _ in "." }
    var board = (minY...maxY).map { _ in dots }
    
    // 좌표이동시켜서 교점에 별찍기
    for location in result {
        let moveX = location.x - minX
        let moveY = location.y - minY
        
        board[moveY][moveX] = "*"
    }
//    board.forEach { print($0) }
    
    // 역순으로 스트링 변환
    var starsStrings: [String] = []
    for i in stride(from: board.count-1, through: 0, by: -1) {
        let string = board[i].joined()
        starsStrings.append(string)
    }
    
    print(starsStrings)
    return starsStrings
}

//solutionP87377([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]])
//solutionP87377([[0, 1, -1], [1, 0, -1], [1, 0, 1]])
//solutionP87377([[1, -1, 0], [2, -1, 0]])
//solutionP87377([[1, -1, 0], [2, -1, 0], [4, -1, 0]])


