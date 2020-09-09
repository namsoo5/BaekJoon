//
//  10870.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/01.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 피보나치수열
private func solution10870() {
    let n = Int(readLine()!)!

    func fibonacci(_ n: Int) -> Int {
        if n == 0  {
            return 0
        }
        if n == 1 {
            return 1
        }
        
        return fibonacci(n-1) + fibonacci(n-2)
    }
    
    print(fibonacci(n))
}

