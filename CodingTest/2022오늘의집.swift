//
//  2022오늘의집.swift
//  BaekJoon
//
//  Created by 남수김 on 2022/03/26.
//  Copyright © 2022 남수김. All rights reserved.
//

import Foundation

private func solution2(beds:[[Int]], tables: [[Int]], cost: Int) -> Int64 {
    struct Bed {
        let w: Int
        let h: Int
        let price: Int
    }
    struct Table {
        let w: Int
        let h: Int
        let price: Int
    }
    typealias Group = (bed: Bed, table: Table)
    var groups: [Group] = []
    beds.forEach {
        let bed = Bed(w: $0[0], h: $0[1], price: $0[2])
        tables.forEach {
            let table = Table(w: $0[0], h: $0[1], price: $0[2])
            groups.append((bed: bed, table: table))
        }
    }
    
    func minArea(group: Group) -> Int {
        // 가로를 긴쪽으로 생각
        let bedH = min(group.bed.h, group.bed.w)
        let bedW = max(group.bed.h, group.bed.w)
        let tableH = min(group.table.h, group.table.w)
        let tableW = max(group.table.h, group.table.w)
        
        let horizonSum = max(tableH, bedH) * (tableW + bedW)
        let verticalSum = (tableH + bedH) * max(tableW, bedW)
        print("area:", min(horizonSum, verticalSum))
        return min(horizonSum, verticalSum)
    }
    
    var minResult = Int64.max
    
    func minMoney(group: Group) -> Int64 {
        let area = minArea(group: group)
        return Int64(group.bed.price + group.table.price + area * cost)
    }
    
    groups.forEach {
        let money = minMoney(group: $0)
        print("money", money)
        if minResult > money {
            minResult = money
        }
    }
    print(minResult)
    return minResult
}
//solution2(beds: [[4,1,200000]], tables: [[2,3,100000]], cost: 10000)
//solution2(beds: [[2,3,40],[2,5,20]], tables: [[1,1,30]], cost: 10000)
//solution2(beds: [[2,3,40000],[2,5,20000]], tables: [[1,1,30000]], cost: 10)
//solution2(beds: [[1,1,1]], tables: [[1,1,1]], cost: 1)
//solution2(beds: [[1000,1000,1000000]], tables: [[1000,1000,1000000]], cost: 10000)


private func solution1(_ rounds: [[String]]) -> Int {
    var couples: [String: String] = [:]
    var beforeCouples: [String] = ["","","",""]
    let index = ["a","b","c","d"]
    var result = 0
    
    for round in rounds {
        for (i, selected) in round.enumerated() {
            let people = index[i]
            if beforeCouples[i] == selected {
                result += 1
                continue
            }
            
            if people == selected {
                result += 1
            } else {
                couples[people] = selected
            }
        }
        
        beforeCouples =  ["","","",""]
        
        for (people, selected) in couples {
            if couples.keys.contains(selected) {
                if couples[selected] == people {
                    let selectedIndex = index.firstIndex(of: selected)!
                    let peopleIndex = index.firstIndex(of: people)!
                    
                    beforeCouples[selectedIndex] = people
                    beforeCouples[peopleIndex] = selected
                }
            }
        }
        couples.removeAll()
    }
    return result
}
