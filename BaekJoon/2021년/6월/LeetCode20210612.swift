//
//  LeetCode20210612.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/13.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
    if startFuel >= target {
        return 0
    }
    
    if stations.isEmpty || stations[0][0] > startFuel {
        return -1
    }

    struct Station: Hashable {
        let pos: Int
        let fuel: Int
    }
    
    let stations = stations.map { Station(pos: $0[0], fuel: $0[1]) }
    
    var dp: [Int] = Array(repeating: 0, count: stations.count+1)
    dp[0] = startFuel
    
    for i in 0..<stations.count {
        for t in stride(from: i, through: 0, by: -1) {
            print(i)
            // 해당연료로 갈수있다면
            if dp[t] >= stations[i].pos {
                // 전의 정류장과 비교하며 최대값으로 갱신
                print("t:\(t) t+1 \(dp[t+1]), t: \(dp[t] + stations[i].fuel)")
                dp[t+1] = max(dp[t+1], dp[t] + stations[i].fuel)
                print(dp)
            }
        }
    }
    
    dp.forEach { print($0) }
    
    
    for i in dp.indices {
        if dp[i] >= target {
            print("i: \(i)")
            return i
        }
    }
    return -1
}

//minRefuelStops(1, 1, [])
//minRefuelStops(100, 1, [[10, 100]])
//minRefuelStops(100, 10, [[10,60], [20,30], [30,30], [60,40]])
//minRefuelStops(100, 50, [[25,25],[50,50]]) // 1
//minRefuelStops(100, 50, [[25,30]]) // -1
//minRefuelStops(1000,
//               83,
//               [[25,27],[36,187],[140,186],[378,6],[492,202],[517,89],[579,234],[673,86],[808,53],[954,49]])
//minRefuelStops(1000,
//               299,
//               [[13,21],[26,115],[100,47],[225,99],[299,141],[444,198],[608,190],[636,157],[647,255],[841,123]])
