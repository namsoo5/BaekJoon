//
//  P12918.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/12.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 문자열 다루기 기본
private func solutionP12918(_ s:String) -> Bool {
    if Int(s) == nil {
        return false
    }
    
    return s.count == 4 || s.count == 6
}

//solutionP12918("a234")
//solutionP12918("1234")
