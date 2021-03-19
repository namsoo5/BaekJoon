//
//  P60057.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/16.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 15:00 - 15:50
// 문자열 압축
private func solutionP60057_2(_ s:String) -> Int {
    let arr = s.map{ $0 }
    var result = Set<String>()
    
    // 문자수가 1개인 예외처리
    if s.count == 1 {
        return 1
    }
    
    // 문자열 단위
    for n in 1...s.count/2 {
        var count = 0
        var zipString = ""
        var beforeString = ""
//        print("------")
        for i in stride(from: n, through: s.count, by: n) {
            let curString = arr[i-n..<i].map { String($0) }.joined()
            if beforeString == "" {
                beforeString = curString
                count += 1
                continue
            }
//            print("count:\(count), \(curString)")
            if curString == beforeString {
                count += 1
            } else {
                if count == 1 {
                    zipString.append(beforeString)
                } else {
                    zipString.append("\(count)\(beforeString)")
                }
                count = 1
            }
            
            // 남은부분 처리
            if i + n > s.count {
                if count == 1 {
                    zipString.append(curString)
                } else {
                    zipString.append("\(count)\(curString)")
                }
                let curString = arr[i..<s.count].map { String($0) }.joined()
                zipString.append(curString)
            }
            beforeString = curString
        }
        result.update(with: zipString)
    }
    
    print(result)
    print(result.min { $0.count < $1.count }!.count)
    return result.min { $0.count < $1.count }!.count
}

//solutionP60057("aabbaccc")
//solutionP60057("ababcdcdababcdcd")
//solutionP60057("abcabcdede")
//solutionP60057("abcabcabcabcdededededede")
//solutionP60057("xababcdcdababcdcd")
//solutionP60057("a")
