//
//  BOARDCOVER.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/02.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 안되는 예외처리 -> 여기서는 남은 영역이 3의배수가 아니면 예외처리됌(L이 3칸차지)
// 시간초과...
// 범위 계산
// 중복 처리
// 같은줄 중복검사 제거

private func 게임판덮기_BOARDCOVER(boards: [String]) {
    let h = boards.count
    let w = boards[0].count
    let boards = boards.map { $0.map{ $0 } }
    var result = 0
    var empty = 0
    boards.forEach {
        $0.forEach {
            if $0 == "." {
                empty += 1
            }
        }
    }
    
    func printArr(arr: [[Character]], type: BlockType) {
        print("=========\(type)===========")
        arr.forEach {
            let row = $0.reduce("") { "\($0)\($1)" }
            print(row)
        }
    }
    
    // 남은영역이 3의배수가 아니라면 채울 수 없는 케이스
    if empty % 3 != 0 {
        print(0)
        return
    }
    
    enum BlockType {
        case center
        case rightDown
        case downRight
        case downLeft
    }
    
    func addBlock(type: BlockType, x: Int, y: Int, boards: [[Character]], empty: Int) {
        var boards = boards
        var empty = empty
        
        if type == .center {
            // 넘치는 경우
            if x+1 >= w || y+1 >= h {
                return
            }
            // 겹치는 경우
            if boards[y][x+1] == "#" || boards[y+1][x] == "#" || boards[y][x] == "#" {
                return
            }
            
            boards[y][x+1] = "#"
            boards[y+1][x] = "#"
            boards[y][x] = "#"
            empty -= 3
        } else if type == .rightDown {
            // 넘치는 경우
            if x+1 >= w || y+1 >= h {
                return
            }
            // 겹치는 경우
            if boards[y][x+1] == "#" || boards[y+1][x+1] == "#" || boards[y][x] == "#" {
                return
            }
            boards[y][x+1] = "#"
            boards[y+1][x+1] = "#"
            boards[y][x] = "#"
            empty -= 3
        } else if type == .downRight {
            // 넘치는 경우
            if x+1 >= w || y+1 >= h {
                return
            }
            // 겹치는 경우
            if boards[y+1][x] == "#" || boards[y+1][x+1] == "#" || boards[y][x] == "#" {
                return
            }
            boards[y+1][x] = "#"
            boards[y+1][x+1] = "#"
            boards[y][x] = "#"
            empty -= 3
        } else if type == . downLeft {
            // 넘치는 경우
            if x-1 < 0 || y+1 >= h {
                return
            }
            // 겹치는 경우
            if boards[y+1][x] == "#" || boards[y+1][x-1] == "#" || boards[y][x] == "#" {
                return
            }
            boards[y+1][x] = "#"
            boards[y+1][x-1] = "#"
            boards[y][x] = "#"
            empty -= 3
        }
//        printArr(arr: boards, type: type)
        // 빈칸 모두덮은 경우
        if empty == 0 {
            result += 1
            return
        }
        
        for i in y..<h {
            for j in 0..<w {
                if boards[i][j] == "#" {
                    continue
                }
                // 같은줄 비교시 전꺼 중복으로 되는 경우 제거
                if i == y && j <= x {
                    continue
                }
                
                addBlock(type: .center, x: j, y: i, boards: boards, empty: empty)
                addBlock(type: .rightDown, x: j, y: i, boards: boards, empty: empty)
                addBlock(type: .downRight, x: j, y: i, boards: boards, empty: empty)
                addBlock(type: .downLeft, x: j, y: i, boards: boards, empty: empty)
            }
            
        }
    }
    
    var isFirst = false
    for i in 0..<h {
        for j in 0..<w {
            if boards[i][j] == "#" {
                continue
            }
            isFirst = true
            addBlock(type: .center, x: j, y: i, boards: boards, empty: empty)
            addBlock(type: .rightDown, x: j, y: i, boards: boards, empty: empty)
            addBlock(type: .downRight, x: j, y: i, boards: boards, empty: empty)
            addBlock(type: .downLeft, x: j, y: i, boards: boards, empty: empty)
            break
        }
        if isFirst {
            break
        }
    }
    
    print(result)
    
}


//게임판덮기_BOARDCOVER(boards: ["#.....#",
//                            "#.....#",
//                            "##...##"])
//게임판덮기_BOARDCOVER(boards: ["#.....#",
//                            "#.....#",
//                            "##..###"])
//게임판덮기_BOARDCOVER(boards: ["##########",
//                            "#........#",
//                            "#........#",
//                            "#........#",
//                            "#........#",
//                            "#........#",
//                            "#........#",
//                            "##########"])

