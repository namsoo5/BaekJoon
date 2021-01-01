//
//  P17686.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/09.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 파일명 정렬
private func solutionP17686(_ files:[String]) -> [String] {
    
    var fileName: [(head: String, number: Int, origin: String)] = []
    
    for file in files {
        var head = ""
        for i in 0..<file.count {
            let c = String(file[at: i])
            if let num = Int(c) {
                var number = num
                for j in i+1..<file.count {
                    let temp = String(file[at: j])
                    if let n = Int(temp) {
                        number *= 10
                        number += n
                    } else {
                        break
                    }
                }
                fileName.append((head, number, file))
                break
            } else {
                head.append(c)
            }
        }
    }
    
    fileName.sort {
        if $0.head.lowercased() == $1.head.lowercased() {
            return $0.number < $1.number
        } else {
            return $0.head.lowercased() < $1.head.lowercased()
        }
    }
    
    let result = fileName.map { $0.origin }
//    print(result)
    return result
}

//solutionP17686(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
//solutionP17686(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])
