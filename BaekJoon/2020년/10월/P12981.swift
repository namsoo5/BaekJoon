//
//  P12981.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/18.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 영어 끝말잇기
private func solutionP12981(_ n:Int, _ words:[String]) -> [Int] {
    var wordSet = Set<String>()
    var lastWord = words[0].first!
    var turn = 0
    var people = 0
    
    for (i, word) in words.enumerated() {
        if wordSet.contains(word) || lastWord != word.first! {
            turn = i/n + 1
            people = i % n + 1
            break
        }
        lastWord = word.last!
        wordSet.update(with: word)
    }
//    print([people, turn])
    return [people, turn]
}
//
//solutionP12981(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
//solutionP12981(2, ["hello", "one", "even", "never", "now", "world", "draw"])
//solutionP12981(3, ["abc", "cd", "def", "fg"])
