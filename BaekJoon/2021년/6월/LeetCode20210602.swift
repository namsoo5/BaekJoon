//
//  LeetCode20210602.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    
    let s1 = s1.map { String($0) }
    let s2 = s2.map { String($0) }
    let s3 = s3.map { String($0) }
    
    if s1.count + s2.count != s3.count {
        return false
    }
    var cache = Set<Cache>()
    struct Cache: Hashable {
        let s1: Int
        let s2: Int
    }
    
    var result = false
    func combinate(s1Index: Int, s2Index: Int) {
        if result {
            return
        }
        if cache.contains(Cache(s1: s1Index, s2: s2Index)) {
            return
        }
        
        let s3Index = s1Index + s2Index
        if s3Index == s3.count {
            result = true
            return
        }
        
        if s1Index < s1.count && s3[s3Index] == s1[s1Index] {
            cache.update(with: Cache(s1: s1Index, s2: s2Index))
            combinate(s1Index: s1Index+1, s2Index: s2Index)
        }
        if s2Index < s2.count && s3[s3Index] == s2[s2Index] {
            cache.update(with: Cache(s1: s1Index, s2: s2Index))
            combinate(s1Index: s1Index, s2Index: s2Index+1)
        }
    }
    
    combinate(s1Index: 0, s2Index: 0)
    
    print(result)
    return result
}

//isInterleave("aabcc", "dbbca", "aadbbcbcac")
//isInterleave("aabcc", "dbbca", "aadbbbaccc")
//isInterleave("", "", "")
//isInterleave("", "", "a")
//isInterleave("aa", "ab", "aaba")
//isInterleave("bbbbbabbbbabaababaaaabbababbaaabbabbaaabaaaaababbbababbbbbabbbbababbabaabababbbaabababababbbaaababaa",
//             "babaaaabbababbbabbbbaabaabbaabbbbaabaaabaababaaaabaaabbaaabaaaabaabaabbbbbbbbbbbabaaabbababbabbabaab",
//             "babbbabbbaaabbababbbbababaabbabaabaaabbbbabbbaaabbbaaaaabbbbaabbaaabababbaaaaaabababbababaababbababbbababbbbaaaabaabbabbaaaaabbabbaaaabbbaabaaabaababaababbaaabbbbbabbbbaabbabaabbbbabaaabbababbabbabbab")
