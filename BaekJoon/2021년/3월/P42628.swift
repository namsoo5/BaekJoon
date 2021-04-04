//
//  P42628.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/30.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 이중우선순위 큐
private func solutionP42628(_ operations:[String]) -> [Int] {
    var maxHeap = PriorityQueue<Int> { $0 > $1 }
    var minHeap = PriorityQueue<Int> { $0 < $1 }
    var group: [Int] = []
    
    for op in operations {
        let words = op.components(separatedBy: .whitespaces)
        let command = words[0]
        let num = Int(words[1])!
        
        switch command {
        case "I":
            group.append(num)
            maxHeap.enQueue(num)
            minHeap.enQueue(num)
        case "D":
            if num == 1 {
                if let remove = maxHeap.deQueue(),
                   let index = group.firstIndex(of: remove) {
                    _ = maxHeap.removeLastElement()
                    group.remove(at: index)
                }
            } else {
                if let remove = minHeap.deQueue(),
                   let index = group.firstIndex(of: remove) {
                    _ = minHeap.removeLastElement()
                group.remove(at: index)
            }
        }
        default:
            break
        }
        
    }
    
    if group.isEmpty {
        return [0, 0]
    }
    
    let max = maxHeap.deQueue() ?? 0
    let min = minHeap.deQueue() ?? 0
    print([max, min])
    return [max, min]
}
//solutionP42628(["I 16","D 1"])
//solutionP42628(["I 7","I 5","I -5","D -1"])
//solutionP42628(["I 4", "I 3", "I 2", "I 1", "D 1", "D 1", "D -1", "D -1", "I 5", "I 6"]) // [6,5]

