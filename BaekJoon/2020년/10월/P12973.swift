//
//  P12973.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/14.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 처음에는 문자열 비교하면서 제거하려햇음
// 시간효율성을 생각하다보니 하나의 문자를 넣으면서 비교하면서 삭제하는 알고리즘은
// 스텍을 사용하는게 최적이라고 생각함
// 짝지어 제거하기
private func solutionP12973(_ s:String) -> Int{
    
    var stack: [Character] = []
    
    s.forEach {
        if let char = stack.last {
            if char == $0 {
                stack.removeLast()
            } else {
                stack.append($0)
            }
        } else {
            stack.append($0)
        }
    }
    return stack.isEmpty ? 1 : 0
}

//solutionP12973("baabaa")
//solutionP12973("cdcd")
