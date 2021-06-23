//
//  2021네웹면접코테.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/11.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func sol1() {
    var value = [3, 4, 8, 3, 2, 7, 8, 4, 8, 5, 3, 2]
    
    //1
    //value.sort()
    //value.sort { $0 < $1 }
    print(value)
    
    let minValue = value[0]
    let maxValue = value.last!
    print("최대: \(maxValue) 최소: \(minValue)")
    
    //2
    
    var minCount = 0
    var maxCount = 0
    let minArr = value.filter { $0 == minValue }
    let maxArr = value.filter { $0 == maxValue }
    print(minArr + maxArr)
    
    //3
    print("최대갯수: \(maxArr.count), 최소갯수: \(minArr.count)")
    
    //4
    
    for i in value.indices {
        for j in i+1..<value.count {
            let temp = value[j]
            if temp < value[i] {
                value[j] = value[i]
                value[i] = temp
            }
        }
    }
    
    print(value)
}


func search(x: Int) -> Int {
    let arr: [Int] = [1,2,3,4,5,6,7,8,9]
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        let midValue = arr[mid]
        
        if x == midValue {
            return mid
        } else if x < midValue {
            end = mid - 1
        } else if x > midValue  {
            start = mid + 1
        }
    }
    
    return -1
}

func search2(x: Int, start: Int, end: Int) -> Int {
    let arr: [Int] = [1,2,3,4,5,6,7,8,9]
    if start > end {
        return -1
    }
    
    let mid = (start + end) / 2
    let midValue = arr[mid]
    
    if x == midValue {
        return mid
    } else if x < midValue {
        return search2(x: x, start: start, end: mid-1)
    } else if x > midValue  {
        return  search2(x: x, start: mid+1, end: end)
    }
    
    return -1
}

