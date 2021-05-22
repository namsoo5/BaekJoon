//
//  LeetCode20210521.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/22.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
    
    /// 알파벳 검사해서 있는값은 그대로넣어주고 새로운값은 +1한값을 넣어줘서 패턴찾기
    func makePatterNum(patterns: String) -> String {
        var dic: [Character: Int] = [:]
        var hash = 0
        var patternNum = ""
        
        for c in patterns {
            if dic.keys.contains(c) {
                patternNum.append("\(dic[c]!)")
            } else {
                dic[c] = hash
                patternNum.append("\(hash)")
                hash += 1
            }
        }
        return patternNum
    }
    
    let origin = makePatterNum(patterns: pattern)
    var result: [String] = []
    for word in words {
        let compare = makePatterNum(patterns: word)
        if origin == compare {
            result.append(word)
        }
    }
    
    print(result)
    return result
}

//findAndReplacePattern(["abc","deq","mee","aqq","dkd","ccc"], "abb")
