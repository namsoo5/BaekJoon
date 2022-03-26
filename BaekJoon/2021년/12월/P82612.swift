//
//  P82612.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
/// 부족한 금액 계산하기
private func solutionP82612(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer = 0
    var sum = 0
    for i in 1...count {
        let fee = price * i
        sum += fee
    }
    
    answer = sum - money
    if answer < 0 {
        answer = 0
    }
    print(answer)
    return Int64(answer)
}
//solutionP82612(3, 20, 4)
