//
//  43162.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/25.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 윈터코딩 네트워크

private func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var networkNum = 0
    
    func bfs(_ node: Int) {
        visited[node] = true
        for i in 0..<n {
            if computers[node][i] == 1 && visited[i] == false {
                bfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            networkNum += 1
            bfs(i)
        }
    }

    return networkNum
}


//private let testA = [[1, 1, 0], [1, 1, 1], [0, 1, 1]]
//private let testB = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
//private let testC = [[1, 1, 0, 0], [1, 1, 0, 0], [0, 0, 1, 1], [0, 0, 1, 1]]
//private let testD = [[1, 1, 0, 1], [1, 1, 0, 0], [0, 0, 1, 1], [1, 0, 1, 1]]
//private let testE = [[1, 1], [1, 1]]
//solution(3, testA)
//solution(3, testB)
//solution(4, testC)
//solution(4, testD)
//solution(2, testE)

/*
struct Node {
    var index: Int
    var networkNum: Int = 0
    var visited = false
    
    init(index: Int) {
        self.index = index
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var networkNum = 1
    var nodeList: [Node] = []
    // 갯수에 맞춰 노드생성
    for i in 0..<n {
        nodeList.append(Node(index: i+1))
    }
    // 첫번째 네트워크 넘버초기화
    nodeList[0].networkNum = networkNum
    for (i, computer) in computers.enumerated() {
        // 네트워크넘버 없을시 +1
        if nodeList[i].networkNum == 0 {
            networkNum += 1
        }
        
        for (j, element) in computer.enumerated() {
            if element == 1 {
//                print("i: \(i) j: \(j) net: \(networkNum)")
                checkNetwork(i: j,
                             networkNum: networkNum,
                             nodeList: &nodeList,
                             arr: computers)
                
            }
            
        }

    }
    print(networkNum)
    return networkNum
}

func checkNetwork(i: Int, networkNum: Int, nodeList: inout [Node], arr: [[Int]]) {
    if nodeList[i].visited {
        return
    }
    // 방문한곳 체크, 네트워크넘버 같이씀
    nodeList[i].visited = true
    nodeList[i].networkNum = networkNum
    
    // 연결된 노드의 인접리스트
    let list = arr[i]
    // 연결된 노드의 인접한곳도 마찬가지로 방문체크를하기위한 반복문
    for i in 0..<list.count {
        if 1 == list[i] {
            checkNetwork(i: i, networkNum: networkNum, nodeList: &nodeList, arr: arr)
        }
    }
    
}

*/
