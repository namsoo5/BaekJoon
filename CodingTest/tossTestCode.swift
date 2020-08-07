//
//  tossTestCode.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solve(_ colorCodes: [String]) -> [(Int, Int, Int)] {
    var result: [(Int, Int, Int)] = []
    colorCodes.forEach {
        var input = $0
        input.removeFirst()
        
        let rIndex = input.index(input.startIndex, offsetBy: 2)
        let gIndex = input.index(rIndex, offsetBy: 2)
        let bIndex = input.index(gIndex, offsetBy: 2)
        print(input[input.startIndex..<rIndex])
        print(input[rIndex..<gIndex])
        print(input[gIndex..<bIndex])
        
        guard let r = Int(input[input.startIndex..<rIndex], radix: 16),
            let g = Int(input[rIndex..<gIndex], radix: 16),
            let b = Int(input[gIndex..<bIndex], radix: 16) else {
                return
        }
        result.append((r,g,b))
        print(r)
        print(g)
        print(b)
    }
    return result
}

