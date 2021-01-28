//
//  P49191.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/20.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


// 감이안옴 검색하니 아래와같은 알고리즘을 사용...
// 다익스트라 - 하나의 정점에서 출발했을 때 모든 정점으로의 최단경로
// 플로이드 와샬 - 모든 정점에서 모든정점으로 최단경로

// 자신의 순위를 확실히하려면 n-1개의 정보가 필요함
// Set을 이용해서 이긴사람과 진사람을 체크한후
// i를 이긴 사람은 i가 이긴사람을 다이김
// i한테 진 사람은 i가 진사람한테 다짐
// 위의 로직을 적용해봤지만 일부 케이스만 통과
// 이긴사람, 진사람이 갱신되면 다시 업데이트되야하는 그과정이 누락된것같음

// 순위
private func solutionP49191(_ n:Int, _ results:[[Int]]) -> Int {
    let max = 9999999
    var node: [[Int]] = (0..<n).map { _ in [Int](repeating: max, count: n) }
    
    // win -> lose
    for result in results {
        node[result[0]-1][result[1]-1] = 1
    }
    
    func floyWashall() {
        for i in 0..<n {
            for j in 0..<n {
                for k in 0..<n {
                    node[j][k] = min(node[j][k], node[j][i] + node[i][k])
                }
            }
        }
    }
    floyWashall()
    
    var result = 0
    for i in 0..<n {
        var visit = true
        for j in 0..<n {
            //  자기자신인 경우 스킵
            if i == j {
                continue
            }
            
            // 방문한적 없는경우찾기
            // [i][j]과 [j][i]중 하나에만 값이 있는경우는 이기고 진과정에서 이긴경우만 저장했기때문
            if node[i][j] == max && node[j][i] == max {
                visit = false
                break
            }
        }
        
        if visit {
            result += 1
        }
    }
    
//    node.forEach { print($0) }
//    print(result)
    return result
}

//solutionP49191(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])
