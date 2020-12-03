//
//  MakeNormalSort.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/25.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func bubbleSort(arr: [Int]) -> [Int] {
    var arr = arr
    for i in arr.indices { // i번 시도
        for j in 1..<arr.count-i { // 끝에서 i번째 정렬됌
            if arr[j-1] > arr[j] { // 스왑
                let temp = arr[j]
                arr[j] = arr[j-1]
                arr[j-1] = temp
            }
        }
    }
    return arr
}

private func selectionSort(arr: [Int]) -> [Int] {
    var arr = arr
    for i in arr.indices { // 삽입할 위치 i
        var minIndex = i
        for j in i+1..<arr.count { // 삽입위치 다음부터 비교
            if arr[minIndex] > arr[j] { // 최솟값 저장
                minIndex = j
            }
        }
        // 스왑
        let temp = arr[minIndex]
        arr[minIndex] = arr[i]
        arr[i] = temp
    }
    return arr
}

private func insertionSort(arr: [Int]) -> [Int] {
    var arr = arr
    for i in 1..<arr.count { // 두번째 원소부터 검사
        for j in stride(from: i, to: 0, by: -1) { // 현재보다 이전의 것과 비교하면서 앞으로 이동
            if arr[j] < arr[j-1] {
                let temp = arr[j]
                arr[j] = arr[j-1]
                arr[j-1] = temp
            }
        }
    }
    return arr
}

//var mock = [6,4,2,3,5,1]
//print(bubbleSort(arr: mock))
//print(selectionSort(arr: mock))
//print(insertionSort(arr: mock))
