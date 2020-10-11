//
//  Line2020하반기공채.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/13.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution1(_ boxes:[[Int]]) -> Int {
    let boxCount = boxes.count
    var dic: [Int: Int] = [:]
    
    for box in boxes {
        for goods in box {
            if dic.keys.contains(goods) {
                dic[goods]! += 1
            } else {
                dic[goods] = 1
            }
        }
    }
    
    var pairCount = 0
    for (_, value) in dic {
        if value % 2 == 0 {
            pairCount += 1
        }
    }
    let needCount = boxCount - pairCount
    
    return needCount
}
//solution([[1, 2], [2, 1], [3, 3], [4, 5], [5, 6], [7, 8]])
//solution([[1, 2], [3, 4], [5, 6]])
//solution([[1, 2], [2, 3], [3, 1]])


private func solution2(_ ball:[Int], _ order:[Int]) -> [Int] {
    
    var ball = ball
    var buffer: Set<Int> = Set()
    var result: [Int] = []
    
    func pop(num: Int) {
        if ball.isEmpty {
            return
        }
        
        while true {
            if buffer.contains(ball.first!) {
                let out = ball.removeFirst()
                result.append(out)
                buffer.remove(out)
            } else if buffer.contains(ball.last!) {
                let out = ball.removeLast()
                result.append(out)
                buffer.remove(out)
            } else {
                break
            }
        }
        
        if ball.first! == num {
            let out = ball.removeFirst()
            result.append(out)
        } else if ball.last! == num {
            let out = ball.removeLast()
            result.append(out)
        } else {
            buffer.update(with: num)
        }
        
    }
    
    for num in order {
        pop(num: num)
    }
    
    return result
}

//print(solution([1, 2, 3, 4, 5, 6], [6, 2, 5, 1, 4, 3]))
//print(solution([11, 2, 9, 13, 24], [9, 2, 13, 24, 11]))


private func solution3(_ n:Int) -> [Int] {
    if n / 10 == 0 {
        return [0, n]
    }
    
    func partition(nString: String) -> Int {
        let count = nString.count
        let startIndex = nString.startIndex
        var halfIndex = nString.index(nString.startIndex, offsetBy: count/2)
        let endIndex = nString.endIndex
        var curIndex = count/2
//        var temp = halfIndex
        var isZero = false
        if nString[halfIndex] == "0" {
            isZero = true
            while nString[halfIndex] == "0" {
                halfIndex = nString.index(nString.startIndex, offsetBy: curIndex)
                curIndex += 1
                if curIndex > count-1 {
                    break
                }
            }
        }
//        halfIndex = temp
        var halfNextIndex = nString.index(nString.startIndex, offsetBy: count/2+1)
        if isZero {
            halfNextIndex = nString.index(nString.startIndex, offsetBy: curIndex/2+1)
        }
        
        if count % 2 == 0 {
            let half = (String(nString[startIndex..<halfIndex]), String(nString[halfIndex..<endIndex]))
            return Int(half.0)! + Int(half.1)!
        } else {
            if isZero {
                let rightMore = (String(nString[startIndex..<halfIndex]), String(nString[halfIndex..<endIndex]))
                return Int(rightMore.0)! + Int(rightMore.1)!
            } else {
                let rightMore = (String(nString[startIndex..<halfIndex]), String(nString[halfIndex..<endIndex]))
                let leftMore = (String(nString[startIndex..<halfNextIndex]), String(nString[halfNextIndex..<endIndex]))
//                print(rightMore)
//                print(leftMore)
                let right = Int(rightMore.0)! + Int(rightMore.1)!
                let left = Int(leftMore.0)! + Int(leftMore.1)!
//                print("right: \(right) left: \(left)")
                return right > left ? left : right
            }
        }
        
    }
    
    var count = 0
    var num = n
    while true {
        num = partition(nString: String(num))
//        print(num)
        count += 1
        if num / 10 == 0 {
            break
        }
    }
    
    return [count, num]
}
//
//print(solution(73425))
//print(solution(10007))
//print(solution(9))
//print(solution(12345))
//print(solution(1001))
//print(solution(41253))
//
