//
//  P12987.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/10.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 배달
// 12: 20 - 13: 14실패

// 그래프를 이용해서 최단거리 계산하는 방법에서 막힘

private func solutionP12978(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 1
    let max = 500001
    var roadInfo: [[Int]] = (0..<N).map { _ in Array(repeating: max, count: N) }
    roadInfo[0][0] = 0
    
    for r in road {
        let a = r[0] - 1
        let b = r[1] - 1
        let value = r[2]
       
        if roadInfo[a][b] > value || roadInfo[a][b] == max {
            roadInfo[a][b] = value
            roadInfo[b][a] = value
        }
    }

    func 플로이드와샬() {
        for i in 0..<N {
            for j in 0..<N {
                for k in 0..<N {
                    roadInfo[j][k] = min(roadInfo[j][i] + roadInfo[i][k], roadInfo[j][k])
                }
            }
        }
    }
    플로이드와샬()
//    roadInfo.forEach { print($0) }
    
    for i in 1..<N {
        if roadInfo[0][i] <= k {
            answer += 1
        }
    }
//    print(answer)
    return answer
}

//solutionP12978(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)
//solutionP12978(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4)
