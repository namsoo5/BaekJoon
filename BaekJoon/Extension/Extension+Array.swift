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
