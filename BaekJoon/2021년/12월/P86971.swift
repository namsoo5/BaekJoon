//
//  P86971.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/04.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


// 전력망을 둘로 나누기
private func solutionP86971(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var parents = (0...n).map { $0 }
    /// 부모노드 찾기
    func findParent(_ node: Int) -> Int {
        if parents[node] == node {
            return node
        } else {
            let parent = findParent(parents[node])
            parents[node] = parent
            
            // 모든 부모업데이트
            for i in 1..<parents.count {
                if parents[i] == node {
                    parents[i] = parent
                }
            }
            return parent
        }
    }
    
    /// 부모저장하기
    func registerParent(start: Int, end: Int) {
        let start = findParent(start)
        let end = findParent(end)
        
        if start != end {
            let temp = parents[end]
            parents[end] = start
            
            // 모든 부모업데이트
            for i in 1..<parents.count {
                if parents[i] == temp {
                    parents[i] = start
                }
            }
        }
    }
    
    var result = 101
    func process(wires: [[Int]]) {
        for wire in wires {
            let start = findParent(wire[0])
            let end = findParent(wire[1])
            
            if start != end {
                registerParent(start: start, end: end)
            }
        }
    }
    
    for i in 0..<wires.count {
        var wires = wires
        let remove = wires.remove(at: i)
        parents = (0...n).map { $0 }
        
//        print("---------")
//        print("제거선: \(remove)")
        process(wires: wires)
//        print("group: \(parents)")
        
        let first = parents[1]
        var sum1 = 0
        var sum2 = 0
        for j in 1..<parents.count {
            if first == parents[j] {
                sum1 += 1
            } else {
                sum2 += 1
            }
        }
        
        let diff = abs(sum1-sum2)
        print("차이: \(diff)")
        result = min(result, diff)
    }
    
    print(result)
    return result
}

//solutionP86971(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]])
//solutionP86971(4, [[1,2],[2,3],[3,4]])
//solutionP86971(7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]])
