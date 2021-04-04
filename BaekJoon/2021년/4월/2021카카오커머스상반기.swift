//
//  2021카카오커머스상반기.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution3(_ n:Int, _ passenger:[Int], _ train:[[Int]]) -> [Int] {
    
    var map = (0..<n).map { _ in Array(repeating: 0, count: n) }
    
    // 경로저장
    train.forEach {
        let station1 = $0[0] - 1
        let station2 = $0[1] - 1
        map[station1][station2] = 1
        map[station2][station1] = 1
    }
    
    var visited = Array(repeating: false, count: n)
    var max = 0
    var maxNode = -1
    
    func subway(num: Int, visited: [Bool], sum: Int) {
//        print("num: \(num), visit: \(visited), sum:\(sum)")
        if max <= sum {
            max = sum
            maxNode = num
        }
        
        var visited = visited
        let canStations = map[num]
        
        // 갈 수 있는 경로중 고르기
        for i in canStations.indices {
            let station = canStations[i]
            if station == 0 || visited[i] {
                continue
            }
            visited[i] = true
            subway(num: i, visited: visited, sum: sum + passenger[i])
            visited[i] = false
        }
    }
    
    visited[0] = true
    subway(num: 0, visited: visited, sum: passenger[0])
    
//    print([maxNode+1, max])
    return [maxNode+1, max]
}

//solution3(6, [1,1,1,1,1,1], [[1,2],[1,3],[1,4],[3,5],[3,6]])
//solution3(4,    [2,1,2,2],    [[1,2],[1,3],[2,4]])
//solution3(5,    [1,1,2,3,4] ,   [[1,2],[1,3],[1,4],[1,5]])


private func solution2(_ needs:[[Int]], _ r:Int) -> Int {
    var dic: [String: Int] = [:]
    
    // 필요한 부품을 키값으로 몇 세트 필요한지 갯수저장
    for need in needs {
        let key = need.map { String($0) }.joined()
        if dic.keys.contains(key) {
            dic[key]! += 1
        } else {
            dic[key] = 1
        }
    }
    
    let visited = Array(repeating: false, count: needs[0].count)
    let element = Array(repeating: 0, count: needs[0].count)
    var max = 0
    
    // 필요한 부품조합해보기 -> 000 001 011 101 ...
    func combination(depth: Int, element: [Int], visited: [Bool], sum: Int) {
//        print("depth: \(depth), element: \(element), sum: \(sum)")
        
        if depth == 2 {
            let key = element.map { String($0) }.joined()
            
            if let value = dic[key] {
                if value > max {
                    max = value + sum
                }
            }
            return
        }
        
        
        let key = element.map { String($0) }.joined()
        var sum = sum
        var visited = visited
        var element = element
        
        if let value = dic[key] {
            sum += value
        }
        
        for i in 0..<needs[0].count {
            if visited[i] {
                continue
            }
            visited[i] = true
            element[i] = 1
            combination(depth: depth+1, element: element, visited: visited, sum: sum)
            element[i] = 0
            visited[i] = false
        }
    }
    
    combination(depth: 0, element: element, visited: visited, sum: 0)
//    print(max)
    return max
}

//solution2([ [ 1, 0, 0 ], [1, 1, 0], [1, 1, 0], [1, 0, 1], [1, 1, 0], [0, 1, 1] ], 2)



private func solution1(_ gift_cards:[Int], _ wants:[Int]) -> Int {
    
    var giftDic: [Int: Int] = [:]
    var giftCard = gift_cards
    
    for card in giftCard {
        if giftDic.keys.contains(card) {
            giftDic[card]! += 1
        } else {
            giftDic[card] = 1
        }
    }
    
    var isWanted: [Bool] = Array(repeating: false, count: wants.count)
    
    // 최초 일치검사
    for i in wants.indices {
        if giftCard[i] == wants[i] {
            isWanted[i] = true
            giftDic[wants[i]]! -= 1
        }
    }
    
    var result = 0
    
    for i in wants.indices {
        // 원하는것을 얻은 경우 스킵
        if isWanted[i] {
            continue
        }
        
        let curCard = giftCard[i]
        let wantCard = wants[i]
        
        print("i: \(i) cur: \(curCard), want: \(wantCard)")
        
        for j in giftCard.indices {
            // 해당 카드가없거나 이미 해당카드를 교환해서 여분이 없는경우
            if giftDic[wants[i]] == nil || giftDic[wants[i]]! <= 0 {
                result += 1
                break
            }
            
            if giftCard[j] == wantCard {
                giftDic[wantCard]! -= 1
                
                giftCard[i] = wantCard
                giftCard[j] = curCard
                isWanted[i] = true
                
                break
            }
        }
    }
    
    print(giftCard)
    print(result)
    
    return result
}

//solution1([4, 5, 3, 2, 1], [2, 4, 4, 5, 1])
//solution1([5, 4, 5, 4, 5], [1, 2, 3, 5, 4])
//solution1([1,1,1,1,3], [1,1,3,2,4])
//solution1([5,4,3,1,2], [1,2,3,4,5])
