//
//  P42627.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/29.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 12:00 - 14:45
// 디스크 컨트롤러
private func solutionP42627(_ jobs:[[Int]]) -> Int {
    
    struct Disk {
        var start: Int
        let process: Int
    }
    
    var jobs = jobs.map { Disk(start: $0[0], process: $0[1]) }
    jobs.sort { $0.start < $1.start }
    
    let firstTime = jobs[0].start
    if firstTime != 0 {
        for i in jobs.indices {
            jobs[i].start -= firstTime
        }
    }
    
    var priorityQueue = PriorityQueue<Disk> {
        if $0.process == $1.process {
            return $0.start < $1.start
        } else {
            return $0.process < $1.process
        }
    }
    
    var curTime = 0
    var totalTime = 0
    var jobsIndex = 0

    while jobsIndex < jobs.count || !priorityQueue.isEmpty() {
    
        while jobsIndex < jobs.count && jobs[jobsIndex].start <= curTime {
            priorityQueue.enQueue(jobs[jobsIndex])
            jobsIndex += 1
//            print("________")
//            priorityQueue.printElement()
        }
        
        if let disk = priorityQueue.deQueue() {
//            print("dequeue: \(disk)")
            totalTime += curTime - disk.start + disk.process
            curTime += disk.process
        } else {
            curTime = jobs[jobsIndex].start
        }

//        print("time: \(curTime)")
//        print("total: \(totalTime)")
    }
    
    let result = totalTime/jobs.count
    print(result)
    return result
}

//solutionP42627([[0,3],[1,9],[2,6]])
//solutionP42627([[0, 3], [4, 3], [10, 3]])  //3
//solutionP42627([[0,10],[2,3],[9,3]]) // 9
//solutionP42627([[0,10]]) // 10
//solutionP42627([[1,10], [3,3], [10,3]]) // 9
//solutionP42627([[0,1],[1,2],[500,6]])
//solutionP42627([[0,4], [0,3], [0,2], [0,1]])
//solutionP42627([[0,1], [0,2], [0,3], [0,4]])
//solutionP42627( [[0, 9], [0, 4], [0, 5], [0, 7], [0, 3]]) // 13
