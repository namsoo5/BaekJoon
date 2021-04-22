//
//  스노우비타.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution1(_ n:Int) -> Int {
    let numString = String(n)
    let ascending = numString.map { String($0) }.sorted(by: <).reduce(""){$0+$1}
    let descending = numString.map { String($0) }.sorted(by: >).reduce(""){$0+$1}
    
    let result = Int(ascending)! + Int(descending)!
    print(result)
    return result
}

//solution1(2613)
//solution1(33285)
