//
//  main.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/08.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation


/*
private func solution7569() -> Int {
    let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let M = input[0] //열
    let N = input[1] //행
    let H = input[2] //높이
    
    var result = 0
    //1익은토마토 0안익은 -1비어잇는
    var tomato: [[[Int]]] = []
    var visited: [[[Bool]]] = []
    var tomatoQueue: [(Int, Int, Int)] = []
    for h in 0..<H {
        tomato.append([])
        for _ in 0..<N {
            let inputTomato = readLine()!.components(separatedBy: " ").map{Int($0)!}
            tomato[h].append(inputTomato)
        }
    }
    
    func bfs(row: Int, col: Int, height: Int) {
        print("row: \(row) col: \(col) height: \(height)")
        if row > N - 1 || row < 0 ||
            col > M - 1 || col < 0 ||
            height > H - 1 || height < 0 {
            return
        }
        
        if visited[height][row][col] {
            return
        }
        
        if tomato[height][row][col] == -1 {
            visited[height][row][col] = true
            return
        }
        if tomato[height][row][col] == 0 {
            tomato[height][row][col] = 1
            tomatoQueue.append((height,row,col))
            return
        }
        let right = col + 1
        let left = col - 1
        let up = row + 1
        let down = row - 1
        let upHeight = height + 1
        let downHeight = height - 1
        
        visited[height][row][col] = true
        bfs(row: up, col: col, height: height)
        bfs(row: down, col: col, height: height)
        bfs(row: row, col: right, height: height)
        bfs(row: row, col: left, height: height)
        bfs(row: row, col: col, height: upHeight)
        bfs(row: row, col: col, height: downHeight)
        
        
        
    }
    for h in 0..<H {
        visited.append([])
        for _ in 0..<N {
            let temp = Array(repeating: false, count: M)
            visited[h].append(temp)
        }
    }
    var allOne = true
    for h in 0..<H {
        for n in 0..<N {
            for m in 0..<M {
                if tomato[h][n][m] == 1 {
                    tomatoQueue.append((h, n, m))
                }
                
                if tomato[h][n][m] == 0 {
                    allOne = false
                }
            }
        }
    }
    if allOne {
        return 0
    }
//
//    for h in 0..<H {
//        for n in 0..<N {
//            for m in 0..<M {
//                if tomato[h][n][m] == 1 && visited[h][n][m] == false {
//                    print("h: \(h) n: \(n) m: \(m)")
//                    result += 1
//                    bfs(row: n, col: m, height: h)
//
//                }
//            }
//        }
//    }
    
    while !tomatoQueue.isEmpty {
        print(tomatoQueue)
        let posHRC = tomatoQueue.removeFirst()
        result += 1
        bfs(row: posHRC.1, col: posHRC.2, height: posHRC.0)
    }
    for h in 0..<H {
        for n in 0..<N {
            
            print(tomato[h][n])
            for m in 0..<M {
//
//                if tomato[h][n][m] == 0 {
//                    return -1
//                }
            }
        }
    }
    return result
}

print(solution7569())
*/
//let endTime = CFAbsoluteTimeGetCurrent() - startTime
//print("\(endTime)s")
