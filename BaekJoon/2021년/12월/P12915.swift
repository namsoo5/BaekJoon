//
//  P12915.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/04.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 문자열 내마음대로 정렬하기
private func solutionP12915(_ strings:[String], _ n:Int) -> [String] {
    var strings = strings.sorted { $0 < $1 }
    strings.sort { $0.getChar(at: n) < $1.getChar(at: n) }
    
    return strings
}

//solutionP12915(["sun", "bed", "car"], 1)
//solutionP12915(["abce", "abcd", "cdx"], 2)
