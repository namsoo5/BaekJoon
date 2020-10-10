//
//  P12951.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/05.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 띄어쓰기가 연속으로 있는경우 생각하지못함

// JadenCase 문자열 만들기
private func solutionP12951(_ s:String) -> String {
    let tempString = s.lowercased()
    var isFirst = true
    var result = ""
    
    for s in tempString {
        if s == " " {
            isFirst = true
            result += String(s)
            continue
        }
        if isFirst {
            isFirst = false
            if Int(String(s)) != nil {
                result += String(s)
                continue
            }
            result += String(s.uppercased())
        } else {
            result += String(s)
        }
    }
    print(result)
    return result
}

//solutionP12951("3people unFollowed me")
//solutionP12951("for the last week")
//solutionP12951("abc  abc")
