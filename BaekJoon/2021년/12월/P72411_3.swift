//
//  P72411_3.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 카카오 2021 메뉴 리뉴얼
private func solutionP72411_3(_ orders:[String], _ course:[Int]) -> [String] {
    
    var storage: [String: Int] = [:]
    
    func combination(order: [String], start: Int, combi: [String]) {
        var temp = combi
        for i in start..<order.count {
            let menu = order[i]
            temp.append(menu)
            
            let setMenu: String = temp.sorted().joined()
            
            if storage.keys.contains(setMenu) {
                storage[setMenu] = storage[setMenu]! + 1
            } else {
                storage[setMenu] =  1
            }
            
            combination(order: order, start: i+1, combi: temp)
            temp = combi
        }
    }
    
    for order in orders {
        let orderList = order.map { String($0) }
        combination(order: orderList, start: 0, combi: [])
    }
    
//    print(storage)
    var result: [String] = []
    var course = course
    while !course.isEmpty {
        let setCount = course.removeLast()
        
        let arr = storage.filter { $0.key.count == setCount && $0.value > 1 }.sorted { $0.value > $1.value }
        if let maxCount = arr.first?.value {
            let addMenu = arr.filter { $0.value == maxCount }.map { $0.key }
            result.append(contentsOf: addMenu)
        }
    }
    print(result.sorted())
    return result.sorted()
}
//
//solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
//solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]    , [2,3,5])
//solution(["XYZ", "XWY", "WXA"], [2,3,4])
