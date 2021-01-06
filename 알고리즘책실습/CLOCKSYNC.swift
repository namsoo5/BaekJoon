//
//  CLOCKSYNC.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/*
 4개의 스위치를 켯다키는걸 확인할 때
0000
----
1000
1100
1010
1001
1110
1101
1011
1111
----
0100
0110
0101
0111
----
0010
0011
----
0001
 */
private func 시계맞추기CLOCKSYNC(inputs: [Int]) {
    let buttons: [Int: [Int]] = [0: [0,1,2],
                                 1: [3,7,9,11],
                                 2: [4,10,14,15],
                                 3: [0,4,5,6,7],
                                 4: [6,7,8,10,12],
                                 5: [0,2,14,15],
                                 6: [3,14,15],
                                 7: [4,5,7,14,15],
                                 8: [1,2,3,4,5],
                                 9: [3,4,5,9,13]]
    
    // 모두 12시인지 검사
    func isComplete(inputs: [Int]) -> Bool {
        for element in inputs {
            if element != 12 {
                return false
            }
        }
        return true
    }
    
    // 버튼 누른 결과 배열 반환
    func switchClick(index: Int, inputs: [Int]) -> [Int] {
        var inputs = inputs
        buttons[index]!.forEach {
            inputs[$0] += 3
            if inputs[$0] == 15 {
                inputs[$0] = 3
            }
        }
        return inputs
    }
    
    let clickStatus = [Int](repeating: 0, count: 10)
    var min = Int.max
    func 완전탐색(status: [Int], inputs: [Int], index: Int, result: Int) {
        // 최소횟수를 넘어간경우는 체크할 필요x
        if result >= min {
            return
        }
//        print(status)
        // 모두 12시가 된상태에서 최소인경우
        if isComplete(inputs: inputs) {
            let sum = status.reduce(0) { $0 + $1 }
            if min > sum {
                min = sum
            }
            return
        }
        
        var status = status
        for i in index..<buttons.count {
            if status[i] == 3 {
                continue
            }
            status[i] += 1
            let arr = switchClick(index: i, inputs: inputs)
            완전탐색(status: status, inputs: arr, index: i, result: result+1)
            status[i] -= 1
        }
    }
    
    
    완전탐색(status: clickStatus, inputs: inputs, index: 0, result: 0)
    
    print(min)
}

//시계맞추기CLOCKSYNC(inputs: [12,6,6,6,6,6,12,12,12,12,12,12,12,12,12,12]) // 2
//시계맞추기CLOCKSYNC(inputs: [12,9,3,12,6,6,9,3,12,9,12,9,12,12,6,6,]) // 9
