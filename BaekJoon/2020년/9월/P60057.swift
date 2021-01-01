//
//  P60057.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/01.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 카카오블라인드2020 문자열 압축
private func solutionP60057(_ s:String) -> Int {
    let arr = s.map{ String($0) }
    
    var length = 1
    var count = 999999
    var lastIndex = 0
    if arr.count == 1 {
        return 1
    }
    
    while true {
        
        if length > arr.count/2 {
            break
        }
        var tempString = ""
        var beforeString = ""
        var tempCount = 0
        // 비교단어 수늘려가면서 중복검사
        for i in stride(from: length, through: arr.count, by: length){
            let word = arr[i-length..<i].reduce(""){ $0 + $1 }
            if (beforeString == word || beforeString == "") {
                tempCount += 1
            } else {
                if tempCount > 1 {
                    tempString += "\(tempCount)\(beforeString)"
                } else {
                    tempString += beforeString
                }
                tempCount = 1
            }
            beforeString = word
            
            lastIndex = i
        }
        // 남은부분 중복검사
        if tempCount > 1 {
            tempString += "\(tempCount)\(beforeString)"
        } else {
            tempString += beforeString
        }

        // 남은부분 처리
        while lastIndex < arr.count {
            tempString += arr[lastIndex]
            lastIndex += 1
        }
        
        if tempString.count < count {
            count = tempString.count
        }
        length += 1
        
    }
    
    print(count)
    return count
}


