//
//  P49189.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/12/10.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// Queue를 이용해서 거리순으로 차례대로 넣어주고
// 큐에 있는 노드를 제거하면서
// 그 큐에 해당하는 노드를 찾는 과정을 반복
// 다른 한곳에 전체 데이터를 저장
// 마지막에 제일 큰 값이 몇갠지 비교

// 가장 먼 노드
private func solutionP49189(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var tree: [Int: [Int]] = [:]
    
    func insertTree(key: Int, value: Int) {
        if tree.keys.contains(key) {
            tree[key]?.append(value)
        } else {
            tree[key] = [value]
        }
    }
    
    for e in edge {
        insertTree(key: e[0], value: e[1])
        insertTree(key: e[1], value: e[0])
    }
    
    var queue: [(Int, Int)] = []
    var result: [(Int, Int)] = []
    var visited: [Bool] = Array(repeating: false, count: tree.keys.count)
    func bfs(key: Int, depth: Int) {
        for node in tree[key]! {
            if visited[node-1] {
                continue
            }
            visited[node-1] = true
            result.append((node, depth))
            queue.append((node, depth))
        }
    }
    
    queue.append((1,0))
    visited[0] = true
    while !queue.isEmpty {
        let node = queue.removeFirst()
        bfs(key: node.0, depth: node.1+1)
    }
    
    let maxNum = result.max {$0.1 < $1.1}.map {$0.1}
    var count = 0
    for node in result {
        if maxNum == node.1 {
            count += 1
        }
    }
    
    return count
}

//solutionP49189(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])

