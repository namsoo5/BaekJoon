//
//  PICNIC.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/01.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
private struct Pair: Hashable {
    var a: Int
    var b: Int
    
    // (1,0) (0,1) 은 같은 짝이기때문에 오름차순으로 생성해서 하나만 체크하도록 설정
    init(a: Int, b: Int) {
        if a < b {
            self.a = a
            self.b = b
        } else {
            self.a = b
            self.b = a
        }
    }
}

private func 소풍_PICNIC(n: Int, m: Int, pairs: [Int]) {
    var friends = Set<Pair>()
    var result = 0
    var before = -1
    for (i, pair) in pairs.enumerated() {
        if i % 2 == 1 {
            friends.update(with: Pair(a: before, b: pair))
        }
        before = pair
    }
    
    var visited = [Bool](repeating: false, count: n)
    func matchPair(before: Int, remain: Int, savePair: [Pair]) {
        if remain == 0 {
            print(savePair)
            result += 1
            return
        }
        
        for i in 0..<n {
            if visited[i] {
                continue
            }
            // 오름차순으로 세트를 검사하기때문에 (3,2)와 같은 경우는 나올 수 없는 경우
            if before > i {
                return
            }
            
            visited[i] = true
            if before != -1 {
                let newPair = Pair(a: before, b: i)
                if !friends.contains(newPair) {
                    visited[i] = false
                    return
                }
                matchPair(before: -1, remain: remain-2, savePair: savePair+[newPair])
            } else {
                matchPair(before: i, remain: remain, savePair: savePair)
            }
            visited[i] = false
        }
    }
    
    for i in 0..<n {
        visited[i] = true
        matchPair(before: i, remain: n, savePair: [])
        visited[i] = false
    }
    print(result)
}

//소풍_PICNIC(n: 2, m: 1, pairs: [0,1]) // 1
//소풍_PICNIC(n: 4, m: 6, pairs: [0,1,1,2,2,3,3,0,0,2,1,3]) // 3
//소풍_PICNIC(n: 10, m: 10, pairs: [0,1,0,2,1,2,1,3,1,4,2,3,2,4,3,4,3,5,4,5]) // 4
