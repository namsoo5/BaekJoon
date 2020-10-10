//
//  P12949.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/05.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solutionP12949(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let tempResult = [Int](repeating: 0, count: arr1.count)
    var result = tempResult.map{[Int](repeating: $0, count: arr2[0].count)}

    // 곱할 arr2의 열
    for loop in 0..<arr2[0].count {
        // arr1 행
        for i in 0..<arr1.count {
            var sum = 0
            // arr1의 열
            for j in 0..<arr1[i].count {
                sum += arr1[i][j] * arr2[j][loop]
            }
            result[i][loop] = sum
        }
    }
    print(result)
    return result
}

//solutionP12949([[1, 4], [3, 2], [4, 1]], [[3, 3], [3, 3]])
//solutionP12949([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]])
//solutionP12949( [[1, 2, 3], [4, 5, 6]],  [[1, 4], [2, 5], [3, 6]])
