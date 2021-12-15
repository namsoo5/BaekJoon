//
//  P81301.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/07.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 숫자 문자열과 영단어
private func solutionP81301(_ s:String) -> Int {
    let number = ["zero": "0",
                  "one": "1",
                  "two": "2",
                  "three": "3",
                  "four": "4",
                  "five": "5",
                  "six": "6",
                  "seven": "7",
                  "eight": "8",
                  "nine": "9"]
    
    var words: String = ""
    var result: String = ""
    for c in s {
        let c = String(c)
        
        if Int(c) != nil {
            result += c
        } else {
            words += c
            
            if let number = number[words] {
                result += number
                words = ""
            }
        }
    }
    
    print(result)
    return Int(result)!
}

//solutionP81301("one4seveneight")
//solutionP81301("23four5six7")
//solutionP81301("2three45sixseven")
//solutionP81301("123")
