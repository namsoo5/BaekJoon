//
//  P86491.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/11/22.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 최소 직사각형
private func solutionP86491(_ sizes:[[Int]]) -> Int {
    
    var maxWidth = 0
    var maxHeight = 0
    // 가로는 작은값
    // 세로는 큰값
    for size in sizes {
        let width = size[0]
        let height = size[1]
        
        let small = min(width, height)
        let big = max(width, height)
        
        if maxWidth == 0 && maxHeight == 0 {
            maxWidth = small
            maxHeight = big
            continue
        }
        
        maxWidth = maxWidth < small ? small : maxWidth
        maxHeight = maxHeight < big ? big : maxHeight
    }
    
//    print(maxWidth * maxHeight)
    return maxWidth * maxHeight
}
//
//solutionP86491([[60, 50], [30, 70], [60, 30], [80, 40]]    )
//solutionP86491([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])
//solutionP86491([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]])
//
