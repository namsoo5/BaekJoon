//
//  P72411.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/26.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 메뉴 리뉴얼
private func solution72411(_ orders:[String], _ course:[Int]) -> [String] {
    var set = [String: Int]()
    
    func dfs(index: Int, origin: [Character], newString: String) {
        // 주어진 최대 길이보다 현재 문자열길이가 길면 검사할필요 x
        if course.last! < newString.count {
            return
        }
        // 주어진 길이에 해당하는 코스길이가 있으면 갯수추가
        if course.contains(newString.count) {
            if set.keys.contains(newString) {
                set[newString]! += 1
            } else {
                set[newString] = 1
            }
        }
        // 현재인덱스 뒤부터 접근
        for i in index..<origin.count {
            let c = origin[i]
            dfs(index: i + 1, origin: origin, newString:  "\(newString)\(c)")
        }
    }
    // 탐색시작
    for order in orders {
        let order = order.sorted()
        dfs(index: 0, origin: order, newString: "")
    }

    // 조합중 2번이상 선택받은 메뉴만 가능
    // 최대값이 같으면 모두포함
    var result = [String]()
    for length in course {
        let temp = set.filter { $0.key.count == length && $0.value > 1 }
        let maxNum = temp.max { $0.value < $1.value }
        let menu = temp.filter { maxNum!.value == $0.value }.map { $0.key }
        result.append(contentsOf: menu)
    }
    
    print(result.sorted())
    return result.sorted()
}

//solution72411(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
//solution72411(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
//solution72411(["XYZ", "XWY", "WXA"], [2,3,4])
