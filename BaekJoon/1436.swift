//
//  1436.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/06.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
//영화감독 숌

private func solution1436() {
    // 666, 1666, 2666, 3666, 4666, 5666, 6660, 6661, 6662, 6663 ... 6669...10666 11666... 16660
    let n = Int(readLine()!)!
    var num = 666
    var count = 0
    while count != n {
        
        var temp = num
        while temp > 0 {
            if temp % 1000 == 666 {
                count += 1
                break
            }
            temp /= 10
        }
       
        num += 1
    }
        
    print(num-1)
}

