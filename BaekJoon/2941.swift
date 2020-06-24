//
//  2941.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/11.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution2941() {
    guard let input = readLine() else {
        return
    }
    let startTime = CFAbsoluteTimeGetCurrent()
    let 크로아티아 = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
    var checkString = ""
    var alphaNum = 0
    
    input.forEach {
        // 알파벳 추가하면서 카운팅
        alphaNum += 1
        checkString.append($0)
        크로아티아.forEach {
            // 크로아티아 알파벳이 존재하면
            if checkString.contains($0) {
                let range = (checkString as NSString).range(of: $0)
                // 크로아티아 알파벳은 1개로 취급하므로 카운팅 빼기
                alphaNum -= (range.length-1)
                // 체크한 스트링 초기화 ( 카운팅은 남아있음 )
                checkString = ""
            }
        }
    }
    print(alphaNum)
    let endTime = CFAbsoluteTimeGetCurrent() - startTime
    print("\(endTime)s")
}

func solution2941_1() {
    guard let input = readLine() else {
        return
    }
    
    var start = input.startIndex
    var alphaNum = 0
    
    while true {
        let end = input.index(start, offsetBy: 2)
        
        if  end >= input.endIndex {
            alphaNum += input[start..<input.endIndex].count
            break
        }
        
        
        if input[start..<end] == "c=" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else if input[start..<end] == "c-" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else if input[start...end] == "dz=" {
            start = input.index(start, offsetBy: 3)
            alphaNum += 1
        } else if input[start..<end] == "d-" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else if input[start..<end] == "lj" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else if input[start..<end] == "nj" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else if input[start..<end] == "s=" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else if input[start..<end] == "z=" {
            start = input.index(start, offsetBy: 2)
            alphaNum += 1
        } else {
            start = input.index(start, offsetBy: 1)
            alphaNum += 1
        }
    }
    
    print(alphaNum)
    
}

//ljes=njak -> 6, 0.0014930963516235352s, 0.0016520023345947266s
//ddz=z= -> 3
