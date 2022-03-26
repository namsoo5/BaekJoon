//
//  P12916.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solutionP12916(_ s:String) -> Bool {
    var pCount = 0
    var yCount = 0
    
    for c in s {
        if c == "p" || c == "P" {
            pCount += 1
        } else if c == "y" || c == "Y" {
            yCount += 1
        }
    }
    
    return pCount == yCount
}
