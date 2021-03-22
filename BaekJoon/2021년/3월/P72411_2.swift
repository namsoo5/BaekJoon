//
//  P72411_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/18.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 메뉴리뉴얼
// 21:05 - 21:45
private func solutionP72411(_ orders:[String], _ course:[Int]) -> [String] {
    var menuSet: [String: Int] = [:]
    var result: [String] = []
    
    // 메뉴마다 나올수있는 코스 조합
    func combination(origin: [Character], n: Int, resultString: String) {
        if resultString.count > 1 && course.contains(resultString.count) {
            if menuSet.keys.contains(resultString) {
                menuSet[resultString]! += 1
            } else {
                menuSet[resultString] = 1
            }
        }
        for i in n+1..<origin.count {
            combination(origin: origin, n: i, resultString: "\(resultString)\(origin[i])")
        }
    }
    
    // 메뉴순회
    for order in orders {
        let menus: [Character] = order.map { $0 }.sorted()
        for i in menus.indices {
            combination(origin: menus, n: i, resultString: "\(menus[i])")
        }
    }
    
    // 가장많은 코스 찾기
    for n in course {
        let max = menuSet.filter { $0.key.count == n && $0.value > 1 }.max { $0.value < $1.value }
        
        if let max = max {
            menuSet.filter { $0.key.count == n }.forEach {
                if $0.value == max.value {
                    result.append($0.key)
                }
            }
        }
    }
    
    print(result.sorted())
    return result.sorted()
}

//solutionP72411(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"] , [2,3,4])
//solutionP72411(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
//solutionP72411(["XYZ", "XWY", "WXA"], [2,3,4])
//
