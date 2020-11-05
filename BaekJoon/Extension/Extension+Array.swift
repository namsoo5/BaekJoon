//
//  Extension+Array.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
extension Array where Element: Comparable {
    /**
     해당값 이상이 처음나오는 위치
     
     - parameter of: 해당값
    */
    func lowerBound(of element: Element) -> Int {
        var left = 0
        var right = count

        while left < right {
            let mid = (left+right)/2

            if self[mid] >= element {
                right = mid
            } else {
                left = mid+1
            }
        }

        return right
    }
    
    /**
     해당값을 초과한값이 처음나오는 위치
     
     - parameter of: 해당값
    */
    func upperBound(of element: Element) -> Int {
        var left = 0
        var right = count

        while left < right {
            let mid = (left+right)/2

            if self[mid] <= element {
                left = mid+1
            } else { right = mid }
        }

        return right
    }
}

extension Array {
    
    func combination<T>(_ input: [T]) -> [[T]] {
        var visited = [Bool](repeating: false, count: input.count)
        var combinationSet: [[T]] = []
        
        func combi(curIndex: Int, limit: Int, count: Int, tempArr: [T]) {
            if limit == count {
                combinationSet.append(tempArr)
                return
            }
            
            for i in curIndex..<input.count {
                if visited[i] {
                    continue
                }
                visited[i] = true
                combi(curIndex: i ,limit: limit, count: count+1, tempArr: tempArr+[input[i]])
                visited[i] = false
            }
        }

        for limit in 1...input.count {
            for i in input.indices {
                if visited[i] {
                    continue
                }
                visited[i] = true
                combi(curIndex: i, limit: limit, count: 1, tempArr: [input[i]])
                visited[i] = false
            }
        }
        
        return combinationSet
    }
}
