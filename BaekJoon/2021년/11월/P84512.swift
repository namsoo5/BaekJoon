//
//  P84512.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/25.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
/// 모음 사전
private func solutionP84512(_ word:String) -> Int {
    
    let alpha: [String] = ["A", "E", "I", "O", "U"]
   
   
    var words: [String] = [String](repeating: "", count: 5) {
        didSet {
            print(words)
        }
    }
    var curWord: String {
        words.joined()
    }
    var count = 0
    
    var check: Bool {
        return curWord == word
    }
    
    for a in 0..<5 {
        words[0] = alpha[a]
        count += 1
        if check {
            return count
        }
        for b in 0..<5 {
            words[1] = alpha[b]
            count += 1
            if check {
                return count
            }
            for c in 0..<5 {
                words[2] = alpha[c]
                count += 1
                if check {
                    return count
                }
                for d in 0..<5 {
                    words[3] = alpha[d]
                    count += 1
                    if check {
                        return count
                    }
                    for e in 0..<5 {
                        words[4] = alpha[e]
                        count += 1
                        if check {
                            return count
                        }
                    }
                    words[4] = ""
                }
                words[3] = ""
            }
            words[2] = ""
        }
        words[1] = ""
    }
    
    return count
}
//print(solutionP84512("AAAAE"))
//print(solutionP84512("AAAE"))
//print(solutionP84512("I"))
//print(solutionP84512("EIO"))
