//
//  P72413.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/27.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 22:20 - 23:40
// 합승 택시 요금
// 플로이드 와샬로 최저요금을 구한뒤에
// 합승요금 + A요금 + B요금 구하는 로직에서 어려움을 겪음
/*
 i가 합승한 지점이라고한다면
 s->i 의 요금과  i->a, i->b의 요금을 다 더한값의 최소값이 원하는답이될것
 */
// max 범위에따라 답이 달라짐( 지점갯수 200개 이하 요금 100,000이하  최대요금은 200*100,000 고려
// 딱 하나만 시간초과가 나는 케이스가 존재
// 플로이드와샬의 최적화가 필요해보임
// 자기자신이거나 가는 경로가없다면 다음 for문 돌지않아도 되니까 효율성 증가
private func solutionP72413(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let maxValue = 20_000_000
    var arr = (0..<n).map { _ in Array(repeating: maxValue, count: n) }
    
    for fare in fares {
        let node1 = fare[0] - 1
        let node2 = fare[1] - 1
        let cost = fare[2]
        
        arr[node1][node2] = cost
        arr[node2][node1] = cost
    }
    
    func 플로이드와샬() {
        for i in 0..<n {
            for j in 0..<n {
                if arr[j][i] == maxValue || i == j {
                    continue
                }
                for k in 0..<n {
                    if j == k {
                        continue
                    }
                    arr[j][k] = min(arr[j][i] + arr[i][k], arr[j][k])
                }
            }
        }
    }
    플로이드와샬()
    var minFare = arr[s-1][a-1] + arr[s-1][b-1]
//    arr.forEach { print($0) }
    for i in 0..<n {
        let start = arr[s-1][i]
        let a = a-1 == i ? 0 : arr[i][a-1]
        let b = b-1 == i ? 0 : arr[i][b-1]
        minFare = min(minFare, start+a+b)
    }
//    print(minFare)
    return minFare
}

//solutionP72413(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]])
//solutionP72413(7, 3, 4, 1, [[5, 7, 9], [4, 6, 4], [3, 6, 1], [3, 2, 3], [2, 1, 6]])
//solutionP72413(6, 4, 5, 6, [[2,6,6], [6,3,7], [4,6,7], [6,5,11], [2,5,12], [5,3,20], [2,4,8], [4,3,9]])
