//
//  P67258.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/22.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 보석 쇼핑
// 16:22 - 17:30
// 더 짧은구간 찾는 알고리즘 - 투포인터알고리즘이용
// 단순히 셋을이용한 구간탐색이아니라 더 짧은 구간을 찾아야함
// 18:45 -19:45
private func solutionP67258(_ gems:[String]) -> [Int] {
    var lists = Set<String>()
    gems.forEach { lists.update(with: $0) }
    
    let kindCount = lists.count
    
    var lastIndex = 0
    var firstIndex = 0
    var min = [-100_000, 100_000]
    
    var newList: [String: Int] = [:]
    var isEvery: Bool {
        newList.count == kindCount
    }
    
    // 마지막인덱스 위치 지정
    for i in gems.indices {
        newList.updateValue((newList[gems[i]] ?? 0) + 1, forKey: gems[i])
        
        if isEvery {
            lastIndex = i
            break
        }
    }
    
    while lastIndex < gems.count {
//        print("\(firstIndex) \(lastIndex)")
//        print(newList)
        
        if isEvery {
            let distance = lastIndex - firstIndex + 1
            let minDistance = min[1] - min[0] + 1
            if minDistance > distance {
                min = [firstIndex, lastIndex]
            }
            
            // 처음인덱스 이동 ->  현재 저장되어있는 데이터를 삭제
            let gem = gems[firstIndex]
            newList.updateValue((newList[gem] ?? 0) - 1, forKey: gem)
            if newList[gem] == 0 {
                newList.removeValue(forKey: gem)
            }
            firstIndex += 1
        } else {
            // 마지막인덱스 이동 -> 데이터를 추가
            lastIndex += 1
            if lastIndex >= gems.count {
                break
            }
            newList.updateValue((newList[gems[lastIndex]] ?? 0) + 1, forKey: gems[lastIndex])
        }
    }
    
    print(min)
    return [min[0]+1, min[1]+1]
}
//
//solutionP67258(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])
//solutionP67258(["AA", "AB", "AC", "AA", "AC"])
//solutionP67258(["XYZ", "XYZ", "XYZ"])
//solutionP67258(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])
//solutionP67258(["A"])
//solutionP67258(["A","B"])
//solutionP67258(["A","B","A","B","C"])
//solutionP67258(["AB","A","CA","A","AA","BA","AB"])
//solutionP67258(["DIA", "EM", "EM", "RUB", "DIA"]) // [3, 5]
