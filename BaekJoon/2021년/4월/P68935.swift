//
//  P68935.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 3진법 뒤집기
private func solutionP68935(_ n:Int) -> Int {
    
    let originString = String(n, radix: 3, uppercase: false)
    let reverseString = originString.reversed().map { String($0) }.reduce(""){$0+$1}
    let reverseInt = Int(reverseString, radix: 3)
    
    return reverseInt!
}

//solutionP68935(45)
//solutionP68935(125)
