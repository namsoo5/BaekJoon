//
//  P68646.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/24.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 처음 접근방법
// 배열을 순회하면서 다음이 더 크다면 삭제하고
// 남은배열에 내가 확인하려는 숫자보다 양옆의 숫자가 작다면
// 남길수 없는 풍선임을 이용
// 작은경우는 최대1번만 허용이기 때문
// -> 시간초과 n^2불가...
//
// 두번째
// 현재 확인하려는 숫자보다 양옆 최소값이 작으면안됌
// 최솟값비교 n, 배열 비교 n -> n^2 같은성능...
//
// 현재 확인숫자 기준으로 왼쪽최솟값과 오른쪽 최솟값을 비교해서 그 둘보다 커야함
// n^2이 불가능하니
// 배열을 만들어서
// 왼쪽부터 비교한 최솟값
// 오른쪽부터 비교한 최솟값을 만들고
// 현재 값과 왼쪽최솟값, 오른쪽최솟값을 비교하는 로직으로 해결
// 3n

// 월간 코드 챌린지 시즌1
// 풍선 터트리기
private func solutionP68646(_ a:[Int]) -> Int {
    
    if a.count < 3 {
        print(a.count)
        return a.count
    }
    
    var result = 0
    var minNum = Int.max
    var leftMins: [Int] = []
    var rightMins: [Int]
    
    for i in 0..<a.count {
        if minNum > a[i] {
            minNum = a[i]
        }
        leftMins.append(minNum)
    }
    
    rightMins = [Int](repeating: 0, count: leftMins.count)
    minNum = Int.max
    for i in stride(from: a.count-1, through: 0, by: -1) {
        if minNum > a[i] {
            minNum = a[i]
        }
        rightMins[i] = minNum
    }
    
    for i in 0..<a.count {
        if leftMins[i] < a[i] && rightMins[i] < a[i] {
            continue
        }
        result += 1
    }
    
    return result
}

//
//solutionP68646([9,-1,-5])
//solutionP68646([-16,27,65,-2,58,-92,-71,-68,-61,-33])
