//
//  P42746_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/17.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 큰수 만들기
private func solutionP42746_2(_ numbers:[Int]) -> String {
    
    let numbers = numbers.map { String($0) }
    let sortNumber = numbers.sorted { $0+$1 > $1+$0 }
    print(sortNumber.joined())
    if sortNumber[0] == "0" {
        return "0"
    }
    return sortNumber.joined()
}

//solutionP42746_2([6,10,2])
//solutionP42746_2([3, 30, 34, 5, 9])
//solutionP42746_2([0,0,0])
