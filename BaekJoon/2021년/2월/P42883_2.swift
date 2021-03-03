//
//  P42883.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/02/24.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 큰 수 만들기
// 100만자리.. Int범위초과 (10자리 -> 1,000,000,000 10억)
// 재귀 불가능

private func solutionP42883(_ number:String, _ k:Int) -> String {
    let number = number.map { $0 }
    var result: String = ""
    var k = k
    var stack: [Character] = []
    
    for i in 0..<number.count {
        let num = number[i]
        
        // 현재 숫자와 마지막자리를 비교
        while !stack.isEmpty && stack.last! < num && k > 0 {
            k -= 1
            stack.removeLast()
        }
        
        // 제거를 다 한상태라면 나머지 뒷부분 바로 이어붙여주기
        if k == 0 {
            print(number[i..<number.count])
            stack.append(contentsOf: number[i..<number.count])
            break
        }
        
        stack.append(num)
    }
    
    // n자리수가 다 같은 수인경우 k가 양수임 -> 원하는 문자열의 길이는 n-k여야함
    if k > 0 {
        result = stack[0..<stack.count-k].reduce("") { "\($0)\($1)" }
    } else {
        result = stack.reduce("") { "\($0)\($1)" }
    }
    
    
    print(result)
    return result
}

//solutionP42883("1924", 2)
//solutionP42883("1231234", 3)
//solutionP42883("4177252841", 4)
//solutionP42883("999", 2)
