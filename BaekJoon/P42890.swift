//
//  P42890.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/28.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 조합을 이용해서 속성의 경우의수를 체크하려했으나 부분집합은 비트마스크로 하는 간단한 방법으로 도전함
// 그조합이 뭔지알필요는없고 후보키에 해당하는 갯수만 세면됌
// 속성1, 속성2, 속성3, 속성4 ->  속성1 -> 1, 속성1, 속성2-> 11, 속성1,속성2,속성3 -> 111, 속성1,속성3 -> 101
// 후보키
private func solutionP42890(_ relation:[[String]]) -> Int {
    
    let columnSize = relation[0].count
    let rowSize = relation.count
    var combiSet = Set<String>()
    var resultSet = Set<Int>()
    
    // 접근할 속성bit
    for bit in 1..<(1<<columnSize) {
        combiSet.removeAll()
        // 데이터 전체 접근
        for r in 0..<rowSize {
            // 데이터 속성 접근
            var tempString = ""
            for c in 0..<columnSize {
                // 1로 켜진속성만 접근
                if (bit & (1<<c)) != 0 {
                    tempString += relation[r][c]
                }
            }
            combiSet.update(with: tempString)
        }
        if combiSet.count == rowSize {
            var isSkip = false
            for value in resultSet {
                if (value & bit) == value {
                    isSkip = true
                    break
                }
            }
            
            if isSkip {
                continue
            }
            resultSet.update(with: bit)
        }
    }
//    print(resultSet)
    return resultSet.count
}

//solutionP42890([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])
