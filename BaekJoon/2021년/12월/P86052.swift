//
//  P86052.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/07.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
/// 빛의 경로 사이클
private func solutionP86052(_ grid:[String]) -> [Int] {
    
    struct Path: Hashable {
        var maxRow: Int
        var maxCol: Int
        var r: Int
        var c: Int
        
        mutating func move(r: Int, c: Int) {
            self.r += r
            self.c += c
            
            if self.r < 0 {
                self.r = maxRow-1
            }
            if self.c < 0 {
                self.c = maxCol-1
            }
            if self.r > maxRow-1 {
                self.r = 0
            }
            if self.c > maxCol-1 {
                self.c = 0
            }
        }
    }
    
    let startDirect = [(-1,0), (1,0), (0,-1), (0,1)] //상,하,좌,우
    
    /// 중복검사
    let toUp: UInt8 = 1
    let toDown: UInt8 = 1 << 1
    let toRight: UInt8 = 1 << 2
    let toLeft: UInt8 = 1 << 3
    
    let grid: [[Character]] = grid.map { $0.map { $0 } }
    var checkLoop: [[UInt8]] = (0..<grid.count).map { _ in (0..<grid[0].count).map { _ in 0 } }
    var result: [Int] = []
    
    func moveDirect(c: Character, direct: (r: Int, c: Int)) -> (r: Int, c: Int) {
        switch c {
        case "R":
            return (direct.c, -direct.r)
        case "S":
            return (direct.r, direct.c)
        case "L":
            return (-direct.c, direct.r)
        default:
            print("?????")
            return (0, 0)
        }
    }
    
    func process(curLight: Path, nextMove: (Int, Int), count: Int, firstDirect: (Int, Int), firstNode: Path) {
//        print(checkLoop)
//        print("cur:\(curLight.r),\(curLight.c)에서 \(nextMove)이동")
        // 처음으로 돌아온경우
        if curLight.r == firstNode.r && curLight.c == firstNode.c && firstDirect == nextMove {
            result.append(count)
//            print("cycle!!------------")
            return
        }
        // 중복 사이클
        if !isValid(path: curLight, direct: nextMove) {
            return
        }
        
        var newLight = curLight
        newLight.move(r: nextMove.0, c: nextMove.1)
        let node = grid[newLight.r][newLight.c]
        let nextMove = moveDirect(c: node, direct: nextMove)
        
        process(curLight: newLight, nextMove: nextMove, count: count+1, firstDirect: firstDirect, firstNode: firstNode)
    }
    
    func isValid(path: Path, direct: (r: Int, c: Int)) -> Bool {
        let bit: UInt8 = checkLoop[path.r][path.c]
        switch direct {
        case (-1,0): //상
            if bit & toUp == 0 {
                checkLoop[path.r][path.c] = checkLoop[path.r][path.c] | toUp
                return true
            } else {
                return false
            }
        case (1,0): // 하
            if bit & toDown == 0 {
                checkLoop[path.r][path.c] = checkLoop[path.r][path.c] | toDown
                return true
            } else {
                return false
            }
        case (0,-1): // 좌
            if bit & toLeft == 0 {
                checkLoop[path.r][path.c] = checkLoop[path.r][path.c] | toLeft
                return true
            } else {
                return false
            }
        case (0,1): // 우
            if bit & toRight == 0 {
                checkLoop[path.r][path.c] = checkLoop[path.r][path.c] | toRight
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
    
    for r in 0..<grid.count {
        for c in 0..<grid[0].count {
//            print("----------")
            let curLight: Path = Path(maxRow: grid.count, maxCol: grid[0].count, r: r, c: c)
            for direct in startDirect {
                if !isValid(path: curLight, direct: direct) {
                    continue
                }
//                print("cur:::\(curLight.r),\(curLight.c)에서 \(direct)이동")
                var newLight = curLight
                newLight.move(r: direct.0, c: direct.1)
                let node = grid[newLight.r][newLight.c]
                let nextMove = moveDirect(c: node, direct: direct)
                
                process(curLight: newLight, nextMove: nextMove, count: 1, firstDirect: direct, firstNode: curLight)
            }
        }
    }
    
    
    result.sort()
    print(result)
    return result
}

//solutionP86052(["SL","LR"])
//solutionP86052(["S"])
//solutionP86052(["R","R"])
//solutionP86052(["SS","SS"]) //[2, 2, 2, 2, 2, 2, 2, 2]
