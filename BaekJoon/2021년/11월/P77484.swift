//
//  P77484.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/05.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 로또의 최고순위와 최저 순위
private func solutionP77484(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCount = 0
    var matchCount = 0
    
    for lotto in lottos {
        if win_nums.contains(lotto) {
            matchCount += 1
        } else if lotto == 0 {
            zeroCount += 1
        }
    }
    
    let minRankCount = 7 - matchCount
    let minRank = minRankCount < 6 ? minRankCount : 6
    
    let maxRankCount = 7 - matchCount - zeroCount
    let maxRank = maxRankCount < 6 ? maxRankCount : 6
    return [maxRank, minRank]
}

//solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19])
//solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25])
//solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35])
