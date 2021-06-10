//
//  이진탐색.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func 이진탐색(search: Int) {
    var arr = [3,7,6,8,9,4,0,1,2,5]
    arr.sort()
    
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        
        let mid = (start + end) / 2
        let midValue = arr[mid]
        print(midValue)
        if search == midValue {
            print("find!")
            break
        } else if search < midValue {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
}
//for i in 0..<10 {
//    print("----start-----")
//    print("search: \(i)")
//    이진탐색(search: i)
//}
