//
//  P43163_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/15.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 단어 변환
private func solutionP43163_2(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) {
        return 0
    }
    
    let target = target.map { String($0) }
    var visited: [Bool] = [Bool](repeating: false, count: words.count)
    var result = 99999
    
    func convertor(current: String, visited: [Bool], count: Int) {
        if current == target.joined() {
            result = min(result, count)
            return
        }
        var visited = visited
        
        for i in 0..<words.count {
            if visited[i] {
                continue
            }
            
            let word = words[i].map { String($0) }
            let current = current.map { String($0) }
//            print("cur: \(current) word: \(word)")
            
            var targetMatch = 0
            var currentNotMatch = 0
            for j in 0..<current.count {
                // 타겟과 일치하는지 체크
                if target[j] == word[j] {
                    targetMatch += 1
                }
                
                // 현재 단어와 일치하는부분이 1개 있어야함
                if current[j] != word[j] {
                    currentNotMatch += 1
                }
            }
            
            if currentNotMatch == 1 && targetMatch >= 1 {
                visited[i] = true
                convertor(current: word.joined(), visited: visited, count: count+1)
                visited[i] = false
            } else {
                continue
            }
        }
    }
    
    for i in 0..<words.count {
        visited[i] = true
        convertor(current: begin, visited: visited, count: 0)
        visited[i] = false
    }
    
    print(result)
    return result
}
//solutionP43163_2("hit","cog",["hot", "dot", "dog", "lot", "log", "cog"])
//solutionP43163_2("hit","cog",["hot", "dot", "dog", "lot", "log"])
