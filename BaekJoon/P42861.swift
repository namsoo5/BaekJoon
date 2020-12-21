//
//  P42861.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/12/21.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// n개를 연결하려면 n-1개의 간선이필요
// 크루스칼 알고리즘 적용
// 최소 신장 트리
// 가중치 오름차순 정렬
// 연결시 각 정점이 같은 집합인지 검사
// union find

// 섬 연결하기
private func solutionP42861(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var parents: [Int] = (0...n-1).map{ $0 }
    let costs = costs.sorted { $0[2]<$1[2] }
    
    /// 최상위 부모 등록
    func unionSet(start: Int, end: Int) {
        var start = start
        var end = end
        
        start = findSet(start)
        end = findSet(end)
        if start != end {
            parents[end] = start
        }
    }
    
    /// 자신의 최상위 부모찾는 함수
    func findSet(_ start: Int) -> Int {
        if parents[start] == start {
            return start
        } else {
            // 자신이 최상위 부모가아니라면 최상위 부모를 찾는 재귀실행
            let parent = findSet(parents[start])
            parents[start] = parent
            
            // 자신을 부모로 가지고 있는 노드들 전부 새로운 부모로 업데이트
            for i in 0..<parents.count {
                if parents[i] == start {
                    parents[i] = parent
                }
            }
            
            return parent
        }
    }
    var result = 0
    for cost in costs {
        let start = findSet(cost[0])
        let end = findSet(cost[1])
        let value = cost[2]
        
        if start != end {
            result += value
            unionSet(start: start, end: end)
        }
    }
//    print(parents)
//    print(costs)
//    print(result)
    
    return result
}

//solutionP42861(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])
//solutionP42861(4, [[0, 1, 5], [1, 2, 3], [2, 3, 3], [3, 1, 2], [3, 0, 4]])
//solutionP42861(5,  [[0, 1, 1], [3, 1, 1], [0, 2, 2], [0, 3, 2], [0, 4, 100]])
