//
//  LeetCode20210518.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/18.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 16:05 - 16:25
private func findDuplicate(_ paths: [String]) -> [[String]] {
    var content: [String: [String]] = [:]
    
    for path in paths {
        // 경로와 파일명 구분
        let arr = path.components(separatedBy: " ")
        let dir = arr[0]
        
        // 파일이 여러개있는경우 파일 한개씩 접근
        for i in 1..<arr.count {
            var file = arr[i]
            var stack: [Character] = []
            // 뒤에서부터 접근
            while !file.isEmpty {
                // (content) 제거하면 파일명 남음
                let c = file.removeLast()
                if c == ")" {
                    continue
                }
                if c == "(" {
                    break
                }
                
                stack.append(c)
            }
            var contentString = ""
            while !stack.isEmpty {
                contentString += "\(stack.removeLast())"
            }
            print(contentString)
            // 키는 컨텐츠로 데이터는 경로와 파일명으로 저장
            if content.keys.contains(contentString) {
                content[contentString]?.append("\(dir)/\(file)")
            } else {
                content[contentString] = ["\(dir)/\(file)"]
            }
        }
    }
    
    var result: [[String]] = []
    content.forEach {
        // 짝이 있는경우에만 더해주기
        if $0.value.count > 1 {
            result.append($0.value)
        }
    }
    print(result)
    return result
}

//findDuplicate(["root/a 1.txt(abcd) 2.txt(efgh)","root/c 3.txt(abcd)","root/c/d 4.txt(efgh)","root 4.txt(efgh)"])
//findDuplicate(["root/a 1.txt(abcd) 2.txt(efsfgh)","root/c 3.txt(abdfcd)","root/c/d 4.txt(efggdfh)"]) // []
