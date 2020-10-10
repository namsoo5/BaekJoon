//
//  P43163.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/25.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 처음에 배열 스트링을 비교하면서 하나만 다른경우 바꿔주는 식으로 구현
// 그러나 이렇게 구현한경우 순서가 뒤집히는 경우나 섞인경우 찾기불가
// 다시 dfs로 구현

// 단어변환
private func solutionP43163(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var visited = [Bool](repeating: false, count: words.count)
    var result = 999999
    
    func dfs(count: Int, begin: String) {
        if begin == target {
            
            if result > count {
                result = count
            }
            return
        }
        
        for i in words.indices {
            if visited[i] {
                continue
            }
            
            var notSame = 0
            let beginArr = begin.map{ String($0) }
            
            for (j,c) in words[i].enumerated() {
                if String(c) != beginArr[j] {
                    notSame += 1
                }
            }
            
            if notSame == 1 {
                visited[i] = true
                dfs(count: count + 1, begin: words[i])
                visited[i] = false
            }
        }
    }
    
    dfs(count: 0, begin: begin)
    
    return result
}

//solutionP43163("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
//solutionP43163("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
