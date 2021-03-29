//
//  MakePrioriryQueue.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/29.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

struct PriorityQueue<T> {
    var heap: [T] = []
    let ordered: (T, T) -> Bool
    
    init(ordered: @escaping (T, T) -> Bool) {
        self.ordered = ordered
    }
    
    /// 큐 뒤에 요소 추가
    mutating func enQueue(_ element: T) {
        heap.append(element)
        upHeapify(heap.count - 1)

    }
    
    /// 큐 앞요소 반환후 삭제
    mutating func deQueue() -> T? {
        if heap.isEmpty {
            return nil
        }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        heap.swapAt(0, heap.count - 1)
        let temp = heap.removeLast()
        downHeapify(0)
        return temp
    }
    
    /// front에 위치한 요소
    func peek() -> T? {
        return heap.first
    }
    
    func isEmpty() -> Bool {
        heap.isEmpty
    }
    
    /// 아래에서 위로 비교
    /// 요소를 추가할때 현재 노드의 부모와 비교해서 위로 올라오는 방식을 취함
    private mutating func upHeapify(_ index: Int) {
        var index = index
        
        // 힙의 index위치의 요소와 부모요소를 비교
        while index > 0 && !ordered(heap[(index-1)/2], heap[index]) {
            heap.swapAt((index-1)/2, index)
            index = (index-1)/2
        }
    }
    
    /// 위에서 아래로 비교
    /// 재정렬할때 부모부터 아래로 내려가면서 검사함
    private mutating func downHeapify(_ index: Int) {
        var index = index
        
        while 2 * index + 1 < heap.count {
            var child = 2 * index + 1
            if child < heap.count - 1 && !ordered(heap[child], heap[child+1]) {
                child += 1
            }
            if !ordered(heap[index], heap[child]) {
                heap.swapAt(index, child)
                index = child
            } else {
                break
            }
        }
    }
    
    func printElement() {
        heap.forEach { print($0) }
    }
}
