//
//  9095.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution9095() {
    let t = Int(readLine()!)!
    var resultList: [Int] = []
    
    for _ in 0..<t {
        var dList = [0,1,2,4]
        let n = Int(readLine()!)!
        
        for i in dList.count...n {
            dList.append(dList[i-3] + dList[i-2] + dList[i-1])
        }
        resultList.append(dList[n])
    }
    
    resultList.forEach {
        print($0)
    }
}
