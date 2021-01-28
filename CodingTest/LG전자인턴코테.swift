//
//  LG전자인턴코테.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/08.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func sol(_ s: String) {
    var result = 0
    var x = 0
    var y = 0
    var before: Character = " "
    
    for (i,s) in s.enumerated() {
        if s == "U" {
            y += 1
        } else if s == "D" {
            y -= 1
        } else if s == "R" {
            x += 1
        } else if s == "L" {
            x -= 1
        }
        
        if x == 0 && y == 0 {
            print(s)
            result += 1
        }
        
        if s == "L" && before == "R"
            || s == "R" && before == "L"
            || s == "U" && before == "D"
            || s == "D" && before == "U" {
            if i == 1 {
                continue
            }
            print("--\(before) \(s)")
            result += 1
        }
        
        before = s
    }
    print(result)
}

//sol("URLLDRLR") // 5
//sol("RLDU") //

private func sol2(_ n: Int, k: Int) {
    let range = Int(pow(Double(2), Double(n)))
    var result: [String] = []
    for i in 0..<range where i % 3 == 0 {
        let binary = String(i, radix: 2, uppercase: false)
        let string = String(format: "%0\(n)d", Int(binary)!)
        print(string)
        var count = 0
        string.filter { $0 == "1" }.forEach { _ in
            count += 1
        }
        if count == 2 {
            result.append(string)
        }
    }
    print(result)
}
//sol2(3, k: 2)
