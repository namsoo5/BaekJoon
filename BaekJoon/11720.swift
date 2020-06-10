//
//  11720.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/10.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

func solution11720() {
    var _ = readLine()!
    let input = readLine()!
    
    var sum = 0
    input.forEach { sum += Int(String($0))! }
    //    print($0.wholeNumberValue)
    print(sum)
}
