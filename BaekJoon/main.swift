//
//  main.swift
//  BaekJoon
//
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
let startTime = Date()
defer {
    processTime(start: startTime)
}

// 0: 기둥, 1: 보
// 0: 삭제, 1: 설치
// 너무 빙빙 돌면서품
// 위치를 하나하나 비교함... 바보같이..
// 간단하게 배열로 풀면 쉬운데 왜생각을못햇지..
// 모두설치 -> 조건검사 -> 조건안맞는거 삭제 ->  삭제 유무 조건검사 -> 처리 -> 정렬 출력 (기존)
// 조건검사후 설치  -> 삭제 -> 조건검사 아니면 되돌리기 (수정)
// 배열하나로는 보와 기둥을 구분불가 -> 2개사용
private func solutionP60061(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    
    var col: [[Bool]] = (0...n).map { _ in [Bool](repeating: false, count: n+1) } // 기둥
    var row: [[Bool]] = (0...n).map { _ in [Bool](repeating: false, count: n+1) } // 보
    var result: [(Int, Int, Int)] = []
    
    func 기둥설치검사(x: Int, y: Int) -> Bool {
        // 바닥이거나,
        if y == 0 {
            return true
        }
        // 보의 한쪽 끝부분 위이거나
        if x-1 >= 0 && row[y][x-1] {
            return true
        }
        // 다른 기둥위에 설치가능
        if y-1 >= 0 && col[y-1][x] {
            return true
        }
        
        return false
    }
    
    func 보설치검사(x: Int, y: Int) -> Bool {
        // 기둥위에 있거나
        if (y-1 >= 0 && x+1 <= n) && (col[y-1][x] || col[y-1][x+1]) {
            return true
        }
        // 양쪽 끝부분이 보와 동시에 연결 되야함
        if x-1 >= 0 && x+1 <= n && row[y][x-1] && row[y][x+1] {
            return true
        }
        
        return false
    }
    
    // 모두설치
//    for build in build_frame {
//        let x = build[0]
//        let y = build[1]
//        let kind = build[2]
//        let isInstall = build[3]
//
//        if isInstall == 1 {
//            if kind == 0 {
//                col[y][x] = true
//            } else {
//                row[y][x] = true
//            }
//        }
//    }
    
    func 삭제가능검사(kind: Int) -> Bool {
        var isCan = true
        
        for i in 0...n {
            for j in 0...n {
                if col[i][j] {
                    if !기둥설치검사(x: j, y: i) {
//                        print("기둥문제: (\(j),\(i))")
                        isCan = false
                        break
                    }
                }
                if row[i][j] {
                    if !보설치검사(x: j, y: i) {
                        isCan = false
                        break
                    }
                }
            }
        }
        
        return isCan
    }
    
    // 설치불가능한것 검사
    for build in build_frame {
        let x = build[0]
        let y = build[1]
        let kind = build[2]
        let isInstall = build[3]
        
        if isInstall == 1 {
            if kind == 0 {
                if 기둥설치검사(x: x, y: y) {
                    col[y][x] = true
                    continue
                } else {
                    col[y][x] = false
//                    print("기둥설치불가: (\(x),\(y))")
                }
            } else {
                if 보설치검사(x: x, y: y) {
                    row[y][x] = true
                    continue
                } else {
                    row[y][x] = false
//                    print("보설치불가: (\(x),\(y))")
                }
            }
        } else if isInstall == 0 {
            if kind == 0 {
                col[y][x] = false
                if !삭제가능검사(kind: kind) {
//                    print("기둥삭제불가: (\(x),\(y))")
                    col[y][x] = true
                }
            } else {
                row[y][x] = false
                if !삭제가능검사(kind: kind) {
//                    print("보삭제불가: (\(x),\(y))")
                    row[y][x] = true
                }
            }
        }
    }
//
//    // 삭제 불가능한것 검사
//    for build in build_frame {
//        let x = build[0]
//        let y = build[1]
//        let kind = build[2]
//        let isInstall = build[3]
//
//
//    }
    
    // 결과 저장
    for i in 0...n {
        for j in 0...n {
            if col[i][j] {
                result.append((j,i,0))
            }
            if row[i][j] {
                result.append((j,i,1))
            }
        }
    }
    
    result.sort {
        if $0.0 == $1.0 {
            if $0.1 == $1.1 {
                return $0.2 < $1.2
            }
            return $0.1 < $1.1
        }
        return $0.0 < $1.0
    }
//    print(result)
    let resultArr = result.map { [$0.0, $0.1, $0.2] }
    print(resultArr)
    return resultArr
}

// 0: 기둥, 1: 보
// 0: 삭제, 1: 설치
// 기둥은 위로 설치. 보는 오른쪽
solutionP60061(5, [[1,0,0,1],
                   [1,1,1,1],
                   [2,1,0,1],
                   [2,2,1,1],
                   [5,0,0,1],
                   [5,1,0,1],
                   [4,2,1,1],
                   [3,2,1,1]])

solutionP60061(5, [[0,0,0,1],
                   [2,0,0,1],
                   [4,0,0,1],
                   [0,1,1,1],
                   [1,1,1,1],
                   [2,1,1,1],
                   [3,1,1,1],
                   [2,0,0,0],
                   [1,1,1,0],
                   [2,2,0,1]])
