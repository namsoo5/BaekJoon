//
//  kakao2020하반기공채.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// MARK: - 3 번문제

private func solution3(_ info:[String], _ query:[String]) -> [Int] {
    var result: [Int] = []
    
    for q in query {
        var queryArr = q.components(separatedBy: " and ")
        let last = queryArr.removeLast().components(separatedBy: .whitespaces)
        queryArr += last
        
        var count = 0
        for one in info {
            
            let oneArr = one.components(separatedBy: .whitespaces)
            if Int(queryArr[4])! > Int(oneArr[4])! {
                continue
            }
         
            if (oneArr[0] == queryArr[0] || queryArr[0] == "-" ) &&
                (oneArr[1] == queryArr[1] || queryArr[1] == "-" ) &&
                (oneArr[2] == queryArr[2] || queryArr[2] == "-" ) &&
                (oneArr[3] == queryArr[3] || queryArr[3] == "-" ) {
                count += 1
            }
        }
        result.append(count)
        
    }
    print(result)
    return result
}

//solution(["java backend junior pizza 150",
//          "python frontend senior chicken 210",
//          "python frontend senior chicken 150",
//          "cpp backend senior pizza 260",
//          "java backend junior chicken 80",
//          "python backend senior chicken 50"],
//         ["java and backend and junior and pizza 100",
//          "python and frontend and senior and chicken 200",
//          "cpp and - and senior and pizza 250",
//          "- and backend and senior and - 150",
//          "- and - and - and chicken 100",
//          "- and - and - and - 150"])



// MARK: - 1 번문제

private func solution1(_ new_id:String) -> String {
    
    let new_id = new_id.lowercased()
    var temp = ""
    for c in new_id {
        if (c.asciiValue! >= 97 && c.asciiValue! <= 122) || (c.asciiValue! >= 48 && c.asciiValue! <= 57) || c == "-" || c == "_" || c == "." {
            temp += String(c)
        }
    }
    
    while true {
        if temp.contains("..") {
            temp = temp.replacingOccurrences(of: "..", with: ".")
        } else {
            break
        }
    }
    
    func removeComma() {
        if temp.first == "." {
            temp.removeFirst()
        }
        if temp.last == "." {
            temp.removeLast()
        }
    }
    removeComma()
    
    
    if temp.isEmpty {
        temp = "a"
    }
    if temp.count >= 16 {
        let startIndex = temp.startIndex
        let endIndex = temp.index(startIndex, offsetBy: 15)
        temp = String(temp[startIndex..<endIndex])
    }
    
    
    removeComma()
    
    if temp.count <= 2 {
        let last = temp.last!
        while temp.count < 3 {
            temp += String(last)
        }
    }
    
    return temp
}
//
//print(solution("...!@BaT#*..y.abcdefghijklm"))
//print(solution("z-+.^."))
//print(solution("=.="))
//print(solution("123_.def"))
//print(solution("abcdefghijklmn.p"))
//
