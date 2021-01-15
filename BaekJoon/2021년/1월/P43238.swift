//
//  P43238.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/12.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 전체를 돌면 안되는 문제
// 시간 복잡도 줄이는 방법...
// n보다 작은방법 logn
// 이진탐색
// 인원이 n보다 적은경우 더 시간이 필요하고
// n보다 적은경우 시간을 줄여도 된다
// n이랑 합이 같다고 종료하면 안됨 더 최소를 구해야하기 때문에

// 입국심사
private func solutionP43238(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    var maxTime = times.last! * n
    var minTime = 1
    var result = 0
    
    while minTime <= maxTime {
        let midTime = (minTime + maxTime) / 2
        var sum = 0
        times.forEach {
            sum += midTime / $0
        }
        print("mid: \(midTime), \(sum)")
        
        if sum < n { // 시간이 더필요함  mid ~ max 검사
            minTime = midTime + 1
        } else { // 인원을 만족해도 시간을 더 줄여야함 최소시간을 찾기위해서 1 ~ mid검사
            maxTime = midTime - 1
            result = midTime
        }
    }
    print(result)
    return Int64(result)
}

//solutionP43238(6, [7,10])

