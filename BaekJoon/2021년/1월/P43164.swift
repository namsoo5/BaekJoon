//
//  P43164.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 배열을 두고 정렬후 하나씩 제거하면서 체크하려고 했음
// 그럴싸하지만 이럴경우에 모든 경우탐색이 불가능해서
// 길을 못찾는경우를 생각할 수 없게된다
// bfs로 다시구현
// 중복되는 검사가 있어서 시간초과
// 알파벳작은 순으로 정렬하는 로직 실패

// 여행경로
private func solutionP43164(_ tickets:[[String]]) -> [String] {
    let tickets: [(String, String)] = tickets.map { ($0[0], $0[1]) }
    var visited: [Bool] = [Bool](repeating: false, count: tickets.count)
    let department: String = "ICN"
    var result: [String] = [department]
    
    func dfs(depart: String, path: [String]) {
        if path.count == tickets.count + 1 {
            if result.count != tickets.count + 1 {
                result = path
                return
            }
            
            for i in 0..<path.count {
                if result[i] > path[i] {
                    result = path
                    return
                } else if result[i] < path[i] {
                    break
                }
            }
        }
        
        for i in 0..<tickets.count {
            if visited[i] {
                continue
            }
            
            let ticket = tickets[i]
            if depart == ticket.0 {
                let arrive = ticket.1
                var path = path
                path.append(arrive)
                visited[i] = true
                dfs(depart: arrive, path: path)
                visited[i] = false
            }
        }
    }
    
    dfs(depart: department, path: result)
    
    print(result)
    return result
}
//solutionP43164([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
//solutionP43164([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])
//solutionP43164([["ICN","A"],["ICN","A"],["A","ICN"]])
//solutionP43164([["ICN","BOO"], ["ICN", "COO"], [ "COO", "DOO" ], ["DOO", "COO"], [ "BOO", "DOO"] ,["DOO", "BOO"], ["BOO", "ICN" ], ["COO", "BOO"]])
//['ICN', 'BOO', 'DOO', 'BOO', 'ICN', 'COO', 'DOO', 'COO', 'BOO']
