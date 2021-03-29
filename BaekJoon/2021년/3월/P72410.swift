//
//  P72410.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/24.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 신규 아이디 추천
// 20:50 - 21:20
private func solutionP72410(_ new_id:String) -> String {
    let new_id = new_id.lowercased()
    var newID = new_id.map { $0 }
    
    func validation2() {
        let alphaAsciiRange = 97...122
        let special = [45,46,95]
        let numAsciiRange = 48...57
        
        var newString: [Character] = []
        for c in newID {
            if alphaAsciiRange ~= Int(c.asciiValue!) || special.contains(Int(c.asciiValue!)) || numAsciiRange ~= Int(c.asciiValue!) {
                    newString.append(c)
                }
            }
        newID = newString
    }
    
    func validation3() {
        var newString: [Character] = []
        var isDot = false
        for c in newID {
            if c == "." {
                isDot = true
            } else {
                if isDot {
                    newString.append(".")
                    newString.append(c)
                    isDot = false
                } else {
                    newString.append(c)
                }
            }
        }
        newID = newString
    }
    
    func validation4() {
        if let first = newID.first, let last = newID.last {
            if first == "." {
                newID.removeFirst()
            }
            if last == "." {
                newID.removeLast()
            }
        }
    }
    
    func validation5() {
        if newID.isEmpty {
            newID.append("a")
        }
    }
    
    func validation6() {
        if newID.count >= 16 {
            newID = newID.indices.filter { $0 < 15 }.map { newID[$0] }
        }
        validation4()
    }
    
    func validation7() {
        if newID.count <= 2 {
            if let last = newID.last {
                for _ in 0..<(3 - newID.count) {
                    newID.append(last)
                }
            }
        }
    }
    
    validation2()
    validation3()
    validation4()
    validation5()
    validation6()
    validation7()
    
    let result = newID.map { String($0) }.joined()
//    print(result)
    
    return (result)
}

//solutionP72410("...!@BaT#*..y.abcdefghijklm")
//solutionP72410("z-+.^.")
//solutionP72410("=.=")
//solutionP72410("123_.def")
//solutionP72410("abcdefghijklmn.p")
