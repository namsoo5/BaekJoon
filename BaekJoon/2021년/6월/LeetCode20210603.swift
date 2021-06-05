//
//  LeetCode20210603.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
    
    var maxHeight = 0
    var maxWidth = 0
    let horizontalCuts = horizontalCuts.sorted()
    let verticalCuts = verticalCuts.sorted()
    
    for i in 0..<horizontalCuts.count {
        var height: Int = 0
        let hori = horizontalCuts[i]
        if i == 0 {
            height = hori
        } else {
            height = hori - horizontalCuts[i-1]
        }
        
        if i == horizontalCuts.count - 1 {
            let temp = h - hori
            height = max(temp, height)
        }
        
        maxHeight = max(maxHeight, height)
    }
    
    
    for i in 0..<verticalCuts.count {
        var width: Int = 0
        let verti = verticalCuts[i]

        if i == 0 {
            width = verti
        } else {
            width = verti - verticalCuts[i-1]
        }
        
        if i == verticalCuts.count - 1 {
            let temp = w - verti
            width = max(temp, width)
        }
        
        maxWidth = max(maxWidth, width)
    }
    print(maxWidth)
    print(maxHeight)
    
    return (maxWidth * maxHeight) % 1000000007
}

//maxArea(5, 4, [1,2,4], [1,3])
//maxArea(5, 4, [3,1], [1])
//maxArea(5, 4, [3], [3])
//maxArea(1000, 1000, [500], [100,200,300,400,500,600,700,800,900])
