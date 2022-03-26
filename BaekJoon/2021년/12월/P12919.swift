//
//  P12919.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 서울에서 김서방 찾기
private func solutionP12919(_ seoul:[String]) -> String {
    let kim = "Kim"
    let result = seoul.enumerated().filter { $0.element == kim }.map { "김서방은 \($0.offset)에 있다" }.first!
    print(result)
    return result
}

//solutionP12919(["Jane", "Kim"])
