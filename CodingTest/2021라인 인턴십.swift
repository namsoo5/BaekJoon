//
//  2021라인 인턴십.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/01.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution1(_ inputString:String) -> Int {
    
    var stack: [Character] = []
    var result = 0
    for (i, c) in inputString.enumerated() {
        if c == "(" || c == "[" || c == "{" || c == "<" {
            stack.append(c)
        } else if c == ")" || c == "]" || c == "}" || c == ">" {
            
            if stack.isEmpty {
                return -i
            } else {
                let open = stack.removeLast()
                
                switch open {
                case "(":
                    if c != ")" {
                        return -i
                    }
                    result += 1
                case "{":
                    if c != "}" {
                        return -i
                    }
                    result += 1
                case "[":
                    if c != "]" {
                        return -i
                    }
                    result += 1
                case "<":
                    if c != ">" {
                        return -i
                    }
                    result += 1
                default:
                    break
                }
            }
        }
    }
    
    if !stack.isEmpty {
        return -(inputString.count-1)
    }
    
    return result
}
//print(solution1("Hello, world!"))
//print(solution1("line [({<plus>)}]"))
//print(solution1("line [({<plus>})"))
//print(solution1(">_<"))
//print(solution1("x * (y + z) ^ 2 = ?"))



private func solution2(_ array:[Int]) -> [Int] {
    
    var result: [Int] = []
    var cache = [Int: Int]()
    for (i, n) in array.enumerated() {
        
        if let num = cache[n] {
            result.append(num)
            continue
        }
        
        var isFound = false
        for j in 1..<array.count {
            if i-j >= 0 && array[i-j] > n {
                isFound = true
                result.append(i-j)
                cache.updateValue(i-j, forKey: n)
                break
            } else if i+j < array.count && array[i+j] > n {
                isFound = true
                result.append(i+j)
                cache.updateValue(i+j, forKey: n)
                break
            }
        }
        
        if !isFound {
            result.append(-1)
            cache.updateValue(-1, forKey: n)
        }
    }
    
    return result
}

//solution2([3, 5, 4, 1, 2])


private  func solution3(_ ads:[[Int]]) -> Int {
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
    }
    
    struct AD {
        let start: Int
        let minus: Int
    }
    
    var ads = ads.map { AD(start: $0[0], minus: $0[1]) }
    ads.sort {
        if $0.start == $1.start {
            return $0.minus > $1.minus
        } else {
            return $0.start < $1.start
        }
    }
    
    var queue = PriorityQueue<AD> {
        if $0.minus == $1.minus {
            return $0.start < $1.start
        } else {
            return $0.minus > $1.minus
        }
    }
    
    var index = 0
    var result = 0
    var time = ads[index].start
    
    while index < ads.count || !queue.isEmpty() {
        
        while index < ads.count && ads[index].start <= time {
            queue.enQueue(ads[index])
            index += 1
        }
        
        if let ad = queue.deQueue() {
            let sec = time - ad.start
            let price = sec * ad.minus
            result += price
            
            time += 5
        } else {
            time = ads[index].start
        }
    }
    
    return result
    
    
    

}


//solution3([[1, 3], [3, 2], [5, 4]])
//solution3([[0, 3], [5, 4]])
//solution3([[0, 1], [0, 2], [6, 3], [8, 4]])
//solution3([[5, 2], [2, 2], [6, 3], [9, 2]])
