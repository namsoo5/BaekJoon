//
//  P17677.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/21.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 뉴스 클러스터링
private func solutionP17677(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.lowercased().map{$0}
    let str2 = str2.lowercased().map{$0}
    
    var union: [String] = []
    var intersection: [String] = []
    
    func division(str: [Character]) {
        for i in 0..<str.count-1 {
            if str[i].asciiValue! < 97 || str[i].asciiValue! > 122 {
                continue
            }
            if str[i+1].asciiValue! < 97 || str[i+1].asciiValue! > 122 {
                continue
            }
            
            let word = String(str[i...i+1])
            union.append(word)
        }
    }
    
    func overlap(str: [Character]) {
        var intersectionTemp = union
        var unionTemp = union
        
        for i in 0..<str.count-1 {
            if str[i].asciiValue! < 97 || str[i].asciiValue! > 122 {
                continue
            }
            if str[i+1].asciiValue! < 97 || str[i+1].asciiValue! > 122 {
                continue
            }
            
            let word = String(str[i...i+1])
            
            for i in intersectionTemp.indices {
                if intersectionTemp[i] == word {
                    intersection.append(word)
                    intersectionTemp.remove(at: i)
                    break
                }
            }
            
            var isHave = false
            for i in unionTemp.indices {
                if unionTemp[i] == word {
                    isHave = true
                    unionTemp.remove(at: i)
                    break
                }
            }
            if !isHave {
                union.append(word)
            }
        }
    }
    
    division(str: str1)
    overlap(str: str2)
    print(union)
    print(intersection)
    if intersection.count == 0 && union.count == 0 {
        print("zero")
        return 65536
    }
    print(Int(floor(Double(intersection.count)/Double(union.count)*65536)))
    return Int(floor(Double(intersection.count)/Double(union.count)*65536))
}
//
//solutionP17677("FRANCE", "french")
//solutionP17677("aa1+aa2", "AAAA12")
//solutionP17677("handshake", "shake hands")
//solutionP17677("E=M*C^2", "e=m*c^2")
//solutionP17677("cd", "ab")
//solutionP17677("12", "12")
//solutionP17677("ab", "12")
//solutionP17677("12ab", "ab")
