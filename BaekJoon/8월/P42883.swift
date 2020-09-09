//
//  P42883.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/22.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 큰 수 만들기
private func solutionP42883(_ number:String, _ k:Int) -> String {
    /*
     dfs이용시 100만자리의 숫자를 검사할때 INT범위를 넘어가기때문에 비교불가능
     카운트 넘어갈시 뒷부분 바로 스트링으로 넣어주기
     배열로 검사시 n번도는순간 시간초과
     남은Count를이용해서 배열을 제거하는방식보단
     String을 바로 원하는 만큼만 잘라서 사용하는게 빠름
     */
    
    let numArr = number.map{ $0 }
    var stack: [Character] = []
    var count = k
    var result = ""
    
    for i in 0..<numArr.count {
        let num = numArr[i]
        while !stack.isEmpty && stack.last! < num && count > 0 {
            count -= 1
            stack.removeLast()
        }
        if count == 0 {
            let startIndex = number.index(number.startIndex, offsetBy: i)
            result = String(number[startIndex..<number.endIndex])
//            print("result: \(result)")
            break
        }
        stack.append(num)
//        print("stack: \(stack)")
    }
    
    // 스택에쌓인 스트링과 뒷부분 스트링 연결
    // count가 남은경우 최종 문자열길이만큼만 반환하면 됨
    let stackString = String(stack)
    let resultString = stackString+result
    let resultIndex = resultString.index(resultString.startIndex, offsetBy: number.count-k)
    return String(resultString[resultString.startIndex..<resultIndex])
}
