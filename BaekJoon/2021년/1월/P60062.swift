//
//  P60062.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/31.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 접근방법 생각못함
// 두 지점의 사이의 거리를 체크해서 비교했으나 한번에 끝나는경우 미충족

// 반시계로 도는것은 시계로 도는 것과 같은 결과가 생김
// 1 -> 2 -> 3 의값과 1 -> 3 -> 2는 거리가 같기 때문

// 순서대로 순회 하기
// 123, 231, 312 이때 n만큼 더해주면 직선이됨

// 검사안한지점이 있는지 검사하는로직 누락
// 배열로 방문체크 -> 시간초과 -> Set이용


// 외벽점검
private func solutionP60062(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let max = Int.max
    var result = max
    var weaks = weak
    var permutationDist: [[Int]] = []
    let visited: [Bool] = [Bool](repeating: false, count: dist.count)
    // 갈수있는 거리의 순열(모든경우 체크)
    func permutation(depth: Int, visited: [Bool], arr: [Int]) {
        if depth == dist.count {
            permutationDist.append(arr)
        }
        var visited = visited
        for i in 0..<dist.count {
            if visited[i] {
                continue
            }
            
            visited[i] = true
            permutation(depth: depth+1, visited: visited, arr: arr+[dist[i]])
            visited[i] = false
        }
    }
    permutation(depth: 0, visited: visited, arr: [])

    // 순서대로 순회
    for _ in weaks.indices {
        // 모든조합 검사
        for permutation in permutationDist {
            var count = 0 // 검사한 사람수 확인
            var visitSet = Set<Int>() // 취약지점 방문햇는지 확인
            var i = 0 // 검사하는 인덱스
            var start = weaks[i]
            let last = weaks.last!
//            print("----")
//            print(permutation)
            print(weaks)
            // 취약지점 수리가능여부검사
            for p in permutation {
                if i > weaks.count - 1 || last < start {
                    break
                }
//                print("start: \(start), p: \(p)")
                start += p
                count += 1
                visitSet.update(with: i)
                // 다음취약지점을 넘어간경우
                if i+1 < weaks.count && start >= weaks[i+1] {
                    // 현재사람이 지나간 취약지점까지 검사함
                    for j in i+1..<weaks.count {
                        if start < weaks[j] { // 작으면 포함하지않음
                            start = weaks[j]
                            i = j - 1
                            break
                        } else if start == weaks[j] { // 같으면 현재자리포함
                            i = j
                        }
                        visitSet.update(with: j)
                    }
                    if visitSet.count == weaks.count { // 모든지점이 검사됬을시 빠져나옴
                        break
                    }
                } else { // 다음지점 검사
                    i += 1
                    if i >= weaks.count {
                        continue
                    }
                    start = weaks[i]
                }
            }
            if visitSet.count == weaks.count { // 모든지점이 검사되지않았으면 제외
                result = min(result, count)
            }
        }
        
        let remove = weaks.removeFirst()
        weaks.append(remove+n)
    }
    print(result)
    
    return result == max ? -1 : result
}

//solutionP60062(12, [1, 5, 6, 10], [1, 2, 3, 4]) // 2
//solutionP60062(12, [1, 3, 4, 9, 10], [3, 5, 7]) // 1
//solutionP60062(200, [0, 10, 50, 80, 120, 160],  [1, 10, 5, 40, 30]) // 3
//solutionP60062(50, [1], [6]) // 1
//solutionP60062(30, [2,20], [3,10]) // 2
//

