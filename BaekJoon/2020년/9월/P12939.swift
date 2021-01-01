//
//  P12939.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/11.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 최댓값과 최솟값
private func solutionP12939(_ s:String) -> String {
    let arr = s.components(separatedBy: .whitespaces).map{ Int($0)! }
    let min = arr.min()!
    let max = arr.max()!
    return "\(min) \(max)"
}
//
//print(solutionP12939("1 2 3 4"))
//print(solutionP12939("-1 -2 -3 -4"))
//print(solutionP12939("-1 -1"))
