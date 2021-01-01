//
//  P70129.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/17.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 이진 변환 반복하기
private func solutionP70129(_ s:String) -> [Int] {
    
    var convertCount = 0
    var removeCount = 0
    var s = s
    
    while true {
        let temp = s.filter {$0 == "1"}
        let newString = String(temp.count, radix: 2, uppercase: false)
        removeCount += (s.count - temp.count)
        s = newString
        
        convertCount += 1
        if s == "1" {
            break
        }
    }
//    print([convertCount, removeCount])
    
    return [convertCount, removeCount]
}
//
//solutionP70129("110010101001")
//solutionP70129("01110")
//solutionP70129("1111111")
