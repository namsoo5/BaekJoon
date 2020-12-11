//
//  P17684.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/06.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 압축
private func solutionP17684(_ msg:String) -> [Int] {
    
    var wordDic: [String: Int] = [:]
    var curIndex = 1
    var result: [Int] = []
    
    for i in 65...90 {
        let alpha = String(UnicodeScalar(i)!)
        wordDic[alpha] = curIndex
        curIndex += 1
    }
    
    var i = 0
    var lastI = 0
    while i < msg.count {
        var lastString = -1
        for j in i..<msg.count {
            let word = msg[i..<j+1]
            if wordDic.keys.contains(word) {
                lastString = wordDic[word]!
                lastI += 1
            } else {
                wordDic[word] = curIndex
                curIndex += 1
//                print("save: \(word)")
                break
            }
        }
        i = lastI
        result.append(lastString)
    }
//    print(result)
    return result
}
//
//solutionP17684("KAKAO")
//solutionP17684("TOBEORNOTTOBEORTOBEORNOT")
//solutionP17684("ABABABABABABABAB")
//
