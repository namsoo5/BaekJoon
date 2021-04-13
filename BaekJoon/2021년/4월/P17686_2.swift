//
//  P17686.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/02.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 3차 파일명 정렬
private func solutionP17686(_ files:[String]) -> [String] {
    var newArr: [(id: Int, String, Int, String)] = []
    
    for j in files.indices {
        let fileName = files[j].map { String($0) }
        for i in fileName.indices {
            if Int(fileName[i]) != nil {
                var endIndex = i
                while endIndex < fileName.count, endIndex < i+5, Int(fileName[endIndex]) != nil {
                    endIndex += 1
                }
                
                let head: String = fileName[0..<i].joined().lowercased()
                let number: Int = Int(fileName[i..<endIndex].joined())!
                let tail: String = fileName[endIndex..<fileName.count].joined()
                
                newArr.append((j, head, number, tail))
                break
            }
        }
    }
    newArr.forEach {
        print($0)
    }
    newArr.sort {
        if $0.1 == $1.1 {
            return $0.2 < $1.2
        } else {
            return $0.1 < $1.1
        }
    }
    var result: [String] = []
    newArr.forEach {
        result.append(files[$0.id])
    }
    result.forEach {
        print($0)
    }
    return result
}

//solutionP17686(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
//solutionP17686(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])
//solutionP17686( ["img000012345", "img1.png","img2","IMG02"])
