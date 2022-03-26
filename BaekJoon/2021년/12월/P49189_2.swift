//
//  P49189.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 가장 먼 노드
private func solutionP49189(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var visited: [Bool] = [Bool](repeating: false, count: n)
    var queue: [Int] = [1]
    var result: [Int] = [Int](repeating: 0, count: n)
    var arr: [[Int]] = [[Int]](repeating: [], count: n)
    
    for element in edge {
        let a = element[0]
        let b = element[1]
        arr[a-1].append(b)
        arr[b-1].append(a)
    }
    
    print(arr)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if visited[node-1] {
            continue
        }
        visited[node-1] = true
        
        for toNode in arr[node-1] {
            let currentDistance = result[node-1]
            if result[toNode-1] != 0 || toNode == 1 {
                continue
            }
            queue.append(toNode)
            result[toNode-1] = currentDistance + 1
            print(result)
        }
        print(node)
       
    }
    
    print(result)
    let maxDistance = result.max()
    let count = result.filter { $0 == maxDistance }.count
    return count
}

//solutionP49189(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])
