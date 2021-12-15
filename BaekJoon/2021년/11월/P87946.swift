//
//  P87946.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/23.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 피로도
private func solutionP87946(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var maxResult = 0
    let visited: [Bool] = [Bool](repeating: false, count: dungeons.count)
    
    var permutationNums: [[Int]] = []
    
    func permutation(depth: Int, visited: [Bool], arr: [Int]) {
        if depth >= dungeons.count {
            permutationNums.append(arr)
            return
        }
        
        var arr = arr
        let temp = arr
        var visited = visited
        for i in dungeons.indices {
            if visited[i] {
                continue
            }
            visited[i] = true
            arr.append(i)
            permutation(depth: depth+1, visited: visited, arr: arr)
            arr = temp
            visited[i] = false
        }
    }
    
    permutation(depth: 0, visited: visited, arr: [])
//    print(permutationNums)
    
    for order in permutationNums {
        var result = 0
        var tempK = k
        for i in order {
            let requirePiro = dungeons[i][0]
            let coast = dungeons[i][1]
            
            if requirePiro > tempK {
                break
            }
            
            tempK -= coast
            result += 1
        }
        
        maxResult = maxResult > result ? maxResult : result
    }
   
//    print(maxResult)
    return maxResult
}

//solutionP87946(80, [[80,20],[50,40],[30,10]])
//solutionP87946(80, [[80,20],[50,40],[30,10]])
