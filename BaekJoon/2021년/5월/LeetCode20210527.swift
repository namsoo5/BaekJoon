//
//  LeetCode20210527.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/27.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func maxProduct(_ words: [String]) -> Int {
    let words = words.sorted { $0.count > $1.count }
    
    // 원본단어와 비교단어사이에 겹치는 문자가 있는지 검사
    func checkWorkd(origin: String, compare: String) -> Bool {
        for c in compare {
            if origin.contains(c) {
                return false
            }
        }
        return true
    }
    
    var maxValue = 0
    for i in words.indices {
        let curWord = words[i]
        for j in i+1..<words.count {
            let compareWord = words[j]
            let multi = curWord.count * compareWord.count
            if maxValue >= multi {
                continue
            }
            
            if checkWorkd(origin: curWord, compare: compareWord) {
                maxValue = max(maxValue, multi)
            }
        }
    }
    
    return maxValue
}

//maxProduct(["abcw","baz","foo","bar","xtfn","abcdef"]) // 16
//print(maxProduct(["a","ab","abc","d","cd","bcd","abcd"])) // 4
//print(maxProduct(["a","b","c"])) // 1
//print(maxProduct(["eae","ea","aaf","bda","fcf","dc","ac","ce","cefde","dabae"])) // 15
