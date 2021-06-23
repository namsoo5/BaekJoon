//
//  LeetCode20210622.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/23.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
    
    var result = 0
    var successSet = Set<String>()
    var failSet = Set<String>()
    for word in words {
        if failSet.contains(word) {
            continue
        }
        if successSet.contains(word) {
            result += 1
            continue
        }
        
        let wordArr = word.map { $0 }
        var index = 0
        for (i, c) in s.enumerated() {
            if index > wordArr.count {
                break
            }
            if index == wordArr.count {
                break
            }
            if c == wordArr[index] {
                print("i: \(index), \(c)")
                index += 1
            }
        }
        
        if index == wordArr.count {
            successSet.update(with: word)
            result += 1
        } else {
            failSet.update(with: word)
        }
    }
    
    print(result)
    return result
}

//numMatchingSubseq("abcde", ["a","bb","acd","ace"])
//numMatchingSubseq("dsahjpjauf", ["ahjpjau","ja","ahbwzgqnuk","tnmlanowax"])
//numMatchingSubseq("vvvvvvvvvvvvvvvvm", ["vm", "vm"])
