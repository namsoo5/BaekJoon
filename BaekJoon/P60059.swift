//
//  P60059.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 열쇠를 90도 돌리고
// 자물쇠의 모서리부터 하나씩 비교하면서 체크하기
// 어케해야할지.. -> 자물쇠의 3개배크기 배열생성
// 겹치는 부분 이동하면서 완전탐색
// 돌기끼리 만나면 안됌
// 키의 크기와 자물쇠의 크기는 다를수 있음

// 2020 카카오 블라인드
// 자물쇠와 열쇠
private func solutionP60059(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    let m = key.count
    let n = lock.count
    var keyList = key
    var newArr: [[Int]] = []
    var newKey: [[Int]] = []
    (1...3*n).forEach { _ in newArr.append([Int](repeating: 0, count: 3*n)) }
    (1...m).forEach { _ in newKey.append([Int](repeating: 0, count: m)) }
    
    func arrPrint(list: [[Int]]) {
        for arr in list {
            print(arr)
        }
        print("-----")
    }
    
    // 시계방향 90도회전
    func rotation(key: [[Int]]) -> [[Int]] {
        var tempKey = newKey
        for i in 0..<m {
            for j in 0..<m {
                tempKey[i][j] = key[m-1-j][i]
            }
        }
        return tempKey
    }
    
    // 3배에 자물쇠 적용
    func fetchNewArr() {
        for i in n..<2*n {
            for j in n..<2*n {
                newArr[i][j] = lock[i-n][j-n]
            }
        }
    }
    
    // 알맞는지 검사
    // 2인경우는 돌기끼리 만난경우, 0인경우는 빈칸이 있는경우
    func checkKey(lock: [[Int]]) -> Bool {
        for i in n..<2*n {
            for j in n..<2*n {
                if lock[i][j] == 0 || lock[i][j] == 2 {
                    return false
                }
            }
        }
        return true
    }
    
    // 키에 맞는지 더하기
    // row: 시작행 col: 시작열
    // 3배자물쇠에 시작점으로부터 row,col만큼 떨어진곳에서 키 맞춰보기
    func addKey(arr: inout [[Int]], row: Int, col: Int) {
        for i in 0..<m {
            for j in 0..<m {
                arr[i+row][j+col] += keyList[i%m][j%m]
            }
        }
    }
    
    fetchNewArr()
    
    for _ in 1...4 {
        keyList = rotation(key: keyList)
//        arrPrint(list: keyList)
        for i in n-m+1..<2*n { // 2n밑으로는 빈칸이라서 검사할 필요가 없음(시작점도 m-n+1위로는 할필요없음)
            for j in n-m+1..<2*n {
                var arr = newArr
                addKey(arr: &arr, row: i, col: j)
//                arrPrint(list: arr)
                if checkKey(lock: arr) {
                    return true
                }
            }
        }
    }
        
    return false
}

//print(solutionP60059([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))


