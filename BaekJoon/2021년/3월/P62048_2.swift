//
//  P62048_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/02.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 멀쩡한 사각형
private func solutionP62048(_ w:Int, _ h:Int) -> Int64 {
    var big = w > h ? w : h
    var small = big == w ? h : w
    var gcd = 0
    // 유클리드 호제법 최대공약수 알고리즘
    for _ in 0... {
        let remain = big % small
        if remain == 0 {
            gcd = small
            break
        }
        big = small
        small = remain
    }
    let total = w*h
    print(Int64(total -  (w + h - gcd)))
    return Int64(total -  (w + h - gcd))
}

//solutionP62048(8, 12)
