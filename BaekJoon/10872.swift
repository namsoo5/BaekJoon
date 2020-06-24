//
//  10872.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/24.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution10872() {
    let n = Int(readLine()!)!
    
    print(팩토리얼(n))
    
}

private func 팩토리얼(_ num: Int) -> Int{
    if num == 1 {
        return num
    }
    return num * 팩토리얼(num-1)
}
