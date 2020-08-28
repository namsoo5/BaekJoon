//
//  P42746.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/27.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solutionP42746(_ numbers:[Int]) -> String {
    
    let temp = numbers.map{ String($0) }
    let result = temp.sorted { Int($0+$1)! > Int($1+$0)! }
    if result[0] == "0" {
        return "0"
    }
    let resultString = result.map{ $0 }.reduce(""){ $0+$1 }
    return resultString
}
