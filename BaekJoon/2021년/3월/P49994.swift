//
//  P49994.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/05.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 방문 길이
private func solutionP49994(_ dirs:String) -> Int {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    struct Line: Hashable {
        var point1: Position
        var point2: Position
        
        static func == (lhs: Line, rhs: Line) -> Bool {
            (lhs.point1 == rhs.point1 && lhs.point2 == rhs.point2) ||
                (lhs.point1 == rhs.point2 && lhs.point2 == rhs.point1)
        }
    }
    
    var visited = Set<Line>()
    var position: Position = Position(x: 0, y: 0)
    
    func move(c: Character) {
        switch c {
        case "U":
            if position.y == 5 {
                return
            }
            position.y += 1
        case "D":
            if position.y == -5 {
                return
            }
            position.y -= 1
        case "R":
            if position.x == 5 {
                return
            }
            position.x += 1
        case "L":
            if position.x == -5 {
                return
            }
            position.x -= 1
        default:
            break
        }
    }
    
    dirs.forEach {
        let origin = position
        move(c: $0)
        if origin != position {
            visited.update(with: Line(point1: origin, point2: position))
            visited.update(with: Line(point1: position, point2: origin))
        }
    }
//    visited.forEach {
//        print("\($0.point1), \($0.point2)")
//    }
//    print(visited.count/2)
    return visited.count/2
}

//solutionP49994("ULURRDLLU")
//solutionP49994("LULLLLLLU")
//solutionP49994("LRLRLR")
