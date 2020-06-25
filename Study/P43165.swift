//
//  P43165.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/24.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
//프로그래머스 dfs 타겟 넘버
private func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    plus(arr: numbers, i: 0, num: numbers[0], result: &result, target: target)
    minus(arr: numbers, i: 0, num: -numbers[0], result: &result, target: target)
    
    return result
}

private func plus(arr: [Int], i: Int, num: Int, result: inout Int, target: Int) {
    if arr.count - 1 == i {
        if num == target {
            result += 1
        }
        return
    }
    
    let value = arr[i+1]
    plus(arr: arr, i: i+1, num: num+value, result: &result, target: target)
    minus(arr: arr, i: i+1, num: num-value, result: &result, target: target)
}

private func minus(arr: [Int], i: Int, num: Int, result: inout Int, target: Int) {
    if arr.count - 1 == i {
        if num == target {
            result += 1
        }
        return
    }
    
    let value = arr[i+1]
    plus(arr: arr, i: i+1, num: num+value, result: &result, target: target)
    minus(arr: arr, i: i+1, num: num-value, result: &result, target: target)
}

//print(solution([1,1,1,1,1], 3))
