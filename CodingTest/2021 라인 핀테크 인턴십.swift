//
//  2021 라인 핀테크 인턴십.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/05.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution1(_ inputString:String) -> Int {
    let numString = (1..<1000).map { String($0) }.joined().map{ String($0) }
    var ten = 0
    var index = 0
    var before = 0
    let inputString = inputString.map { String($0) }
    for s in inputString {
        for i in index..<numString.count {
            let num = numString[i]
//            print(num)
            if before == 9 {
                ten += 10
            }
            before = Int(num)!
            if s == num {
                index = i+1
                break
            }
        }
    }
//    print(index)
//    print(ten + Int(inputString.last!)!)
    return ten + Int(inputString.last!)!
}

//solution1("123903") // 13
//solution1("111") // 21
//solution1("1919") // 19
//solution1("19000") // 30
//solution1("2349101") // 11

private func solution3(_ n:Int, _ data:[String], _ limit:String) -> [String] {
    
    struct DataInfo {
        let name: String
        let number: String
        let requireTime: Int
        let requireSpace: Int
    }
    
    var datas: [DataInfo] = []
    let limits = limit.components(separatedBy: .whitespaces)
    let timeLimit = Int(limits[0])!
    let spaceLimit = Int(limits[1])!
    
    for e in data {
        let arr = e.components(separatedBy: .whitespaces)
        datas.append(DataInfo(name: arr[0], number: arr[1], requireTime: Int(arr[2])!, requireSpace: Int(arr[3])!))
    }
    
    var dataCombinate: [[DataInfo]] = []
    
    // 조합찾기
    func combinate(i: Int, combi: [DataInfo]) {
        if combi.count == n {
            dataCombinate.append(combi)
            return
        }
        
        for j in i+1..<datas.count {
            let curData = datas[j]
            var isValid = true
            // 이름같거나 알고리즘번호같으면 예외
            for data in combi {
                if data.name == curData.name || data.number == curData.number {
                    isValid = false
                    break
                }
            }
            if isValid {
                combinate(i: j, combi: combi+[curData])
            }
        }
    }
    
    
    for i in datas.indices {
        let data = datas[i]
        combinate(i: i, combi: [data])
    }
    var result: [DataInfo] = []
    var minSumResource = Int.max
    for dataCombi in dataCombinate {
        var totalTime = 0
        var totalSpace = 0
        for data in dataCombi {
            totalTime += data.requireTime
            totalSpace += data.requireSpace
        }
        // 제한사항 맞으면
        if (timeLimit == 0 || totalTime <= timeLimit) && (spaceLimit == 0 || totalSpace <= spaceLimit) {
            // 최적알고리즘 저장
            if totalSpace + totalTime < minSumResource {
                minSumResource = totalSpace + totalTime
                result = dataCombi
            }
        }
    }
    
    let names = result.map { $0.name }
    print(names)
    
    return names
}

//solution3(2, ["a1 1 5 9", "a2 1 9 5", "b1 2 3 3"], "0 10")
//solution3(3, ["a1 1 5 5", "b1 2 1 1", "c1 3 5 1"], "10 10")
//solution3(2, ["a1 1 6 6", "a2 1 2 9", "b1 2 3 3", "b2 2 4 1"], "0 0")


private func solution4(_ n:Int, _ queries:[[Int]]) -> [Int] {
    
    var stacks: [[Int]] = []
    (0..<n).forEach { _ in stacks.append([]) }
    var center = -1
    var result: [Int] = []
    for query in queries {
        let index = query[0] - 1
        let element = query[1]
        
        // pop
        if element == -1 {
            // 중앙값 제거
            if stacks[index].count == 1 {
                let removeElement = stacks[index][0]
                print("removeCenter: \(removeElement)")
                result.append(removeElement)
                
                var tempIndex = index
                while true {
                    tempIndex += 1
                    if tempIndex == stacks.count {
                        tempIndex = 0
                    }
                    
                    if stacks[tempIndex].count > 1 {
                        let centerElement = stacks[tempIndex][1]
                        print("center: \(centerElement)")
                        for i in 0..<n {
                            stacks[i][0] = centerElement
                        }
                        break
                    }
                }
            } else {
                if stacks[index].isEmpty {
                    result.append(-1)
                } else {
                    let removeElement = stacks[index].removeLast()
                    print("remove: \(removeElement)")
                    result.append(removeElement)
                }
            }
        } else {
            if center == -1 {
                for i in 0..<n {
                    stacks[i].append(element)
                }
                center = element
            } else {
                stacks[index].append(element)
            }
        }
        
        for (i, stack) in stacks.enumerated() {
            print("\(i+1)스택: \(stack)")
        }
        print("----")
    }
    
    print(result)
    return result
}

//solution4(3, [[1,4],[2,2],[1,3],[1,6],[3,-1],[2,-1]])
//solution4(4, [[1,3],[1,2],[3,6],[3,-1],[4,5],[2,-1],[3,-1],[1,-1]])
//solution4(5, [[1,-1],[2,-1],[3,-1],[4,-1],[5,-1]])

private func solution2(_ endingTime:Int, _ jobs:[[Int]]) -> [Int] {

    struct Job {
        var id: Int
        var inputTime: Int
        var validTime: Int
        var workTime: Int
        
        func work() -> Int {
            return workTime
        }
    }
    
    class RealTimeQueue {
        private var time = 0
        private var queue: [Job] = []
        var endTime = 0
       
        private func enqueue(_ job: Job) {
            queue.append(job)
        }
        
        private func dequeue() -> Job? {
            if queue.isEmpty {
                return nil
            }
            return queue.removeFirst()
        }
        
        private func getCurrentTime() -> Int {
            return time
        }
        
        func push(_ job: Job) {
            if job.validTime < getCurrentTime() {
                return
            }
            enqueue(job)
        }
        
        func pop() -> Job? {
            while true {
                guard let job = dequeue() else {
                    break
                }
                
                if job.validTime < getCurrentTime() {
                    continue
                }
                
                if job.inputTime > getCurrentTime() {
                    time = job.inputTime
                }
                time += job.work()
                
                if time > endTime {
                    return nil
                }
                
                if job.validTime >= getCurrentTime() {
                    return job
                }
            }
            return nil
        }
        
        var isEmpty: Bool {
            return queue.isEmpty
        }
    }
    
    let queue = RealTimeQueue()
    for job in jobs {
        queue.push(Job(id: job[0], inputTime: job[1], validTime: job[2], workTime: job[3]))
    }
    queue.endTime = endingTime
    
    var result: [Int] = []
    while !queue.isEmpty {
        if let job = queue.pop() {
            result.append(job.id)
        }
    }
    print(result)
    return result
}

//solution2(10, []) // []
//solution2(30, [[1, 10, 20, 6], [2, 12, 20, 8], [3, 20, 30, 2], [4, 25, 40, 10]]) // [1,3]
//solution2(0, [[1, 10, 20, 4], [2, 12, 20, 2]]) // []
