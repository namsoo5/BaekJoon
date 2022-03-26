//
//  P87390.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/08.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// n^2 배열 자르기
private func solutionP87390(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result: [Int] = []
    
    for i in left...right {
        let row: Int = Int(i) / n
        let col: Int = Int(i) % n
        
        if row < col {
            let gap = (row+1) + (col-row)
            result.append(gap)
        } else {
            result.append(row+1)
        }
    }
    
    return result
}

//solutionP87390(3, 2, 5)
//solutionP87390(4, 7, 14)
