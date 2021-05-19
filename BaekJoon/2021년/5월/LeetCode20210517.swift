//
//  LeetCode20210517.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/17.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 17:00 - 18:20
private func longestStrChain(_ words: [String]) -> Int {
    var chainCount = 0
    var words = words.sorted() { $0.count < $1.count }
    var check = Set<String>()
    var sizeGroup = Set<Int>()
    
    for word in words {
        sizeGroup.update(with: word.count)
    }
    
    func sub(s: String, count: Int) {
        // 문자열이 비었거나, 주어진문자열 + 연속된갯수가 연속된갯수의 최대값보다 작다면 스킵
        if s.isEmpty || s.count + count <= chainCount {
            return
        }
        
        // 이미 검사한 단어라면 스킵 (긴 문자열부터 검사하므로 이후결과같음)
        if check.contains(s) {
            return
        }
        
        // 1개 감소한 단어가 그룹에 없다면 바로스킵
        if !sizeGroup.contains(s.count - 1) {
            chainCount = max(chainCount, count)
            return
        }
    
        var temp = s
        check.update(with: s)
        
        var noMember = true
        for i in temp.indices {
            temp.remove(at: i) // n
            if words.contains(temp) {
                noMember = false
                sub(s: temp, count: count + 1)
            }
            temp = s
        }
        
        if noMember {
            chainCount = max(chainCount, count)
        }
    }
    
    for i in words.indices.reversed() {
        let word = words[i]
        if chainCount >= word.count {
            break
        }
        
        sub(s: word, count: 1)
        words.removeLast()
    }
    print(chainCount)
    return chainCount
}

//longestStrChain(["a","b","ba","bca","bda","bdca"])
//longestStrChain(["xbc","pcxbcf","xb","cxbc","pcxbc"])
