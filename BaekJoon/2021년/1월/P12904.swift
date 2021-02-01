//
//  P12904.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/28.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 처음시도
// 한 인덱스를 기준으로 좌우로 비교
// 좌우중 작은 수만큼만 비교
// 같은 경우 +2 하면서 길이 측정 -> 6개 테스트실패

// 글자수 1인경우 1나오도록함 ->  5개 테스트실패
// 글자수 2인경우 검사케이스추가 -> 5개 테스트실패 (그대로...)

// 글자수가 짝수인데 팰린드롬인경우 abccba 반례..!
// 기존 0..<i 와 i+1..<n를 비교햇고  -> a[b]a케이스
// 여기에추가로
// 0...i 와 i+1..<n을 비교함 i,i+1이 양옆부터 같은경우도 검사하기위함 -> a[b][b]a 케이스


// 가장 긴 팰린드롬
private func solutionP12904(_ s:String) -> Int {
    let arr: [Character] = s.map { $0 }
    var result = 1
    // 길이가 2인경우 검사케이스
    if arr.count == 2 && arr[0] == arr[1] {
        print(2)
        return 2
    }
    
    // 한개의 인덱스를 기준으로 좌우비교
    for i in 1..<arr.count {
        let fronts: [Character] = arr[0..<i].reversed()
        let ends: [Character] = arr[i+1..<arr.count].map{ $0 }
        
        let minCount = min(fronts.count, ends.count)
        var tempResult = 1
        for j in 0..<minCount{
            let front = fronts[j]
            let end = ends[j]
            
            if front == end {
                tempResult += 2
            } else {
                break
            }
        }
        result = max(result, tempResult)
    }
    // 두개의 인덱스를 기준으로 좌우비교
    for i in 1..<arr.count {
        let fronts: [Character] = arr[0...i].reversed()
        let ends: [Character] = arr[i+1..<arr.count].map{ $0 }
        
        let minCount = min(fronts.count, ends.count)
        var tempResult = 0
        for j in 0..<minCount{
            let front = fronts[j]
            let end = ends[j]
            
            if front == end {
                tempResult += 2
            } else {
                break
            }
        }
        result = max(result, tempResult)
    }
    print(result)
    return result
}
//
//solutionP12904("ABCCBA")
//solutionP12904("abcdcba")
//solutionP12904("abacde")
//
//
