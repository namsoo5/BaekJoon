//
//  LeetCode20210616.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/16.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
private func generateParenthesis(_ n: Int) -> [String] {
    
    var result: [String] = []
    func make(open: Int, close: Int, s: String) {
        if close == n {
            result.append(s)
            return
        }
      
        if open < n {
            make(open: open + 1, close: close, s: "\(s)(")
        }
        if close < open {
            make(open: open, close: close + 1, s: "\(s))")
        }
    }
    
    make(open: 0, close: 0, s: "")
    print(result)
    return result
}

//generateParenthesis(3)
