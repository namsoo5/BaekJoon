//
//  P42892.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/04.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 길 찾기 게임
private func solutionP42892(_ nodeinfo:[[Int]]) -> [[Int]] {
    class Node {
        let index: Int
        let x: Int
        let y: Int
        var left: Node?
        var right: Node?
        var parent: Node?
        
        init(index: Int, x: Int, y: Int) {
            self.index = index
            self.x = x
            self.y = y
        }
        
        func addNode(_ node: Node) {
            if node.x < self.x {
                if let left = left {
                    left.addNode(node)
                } else {
                    node.parent = self
                    left = node
                }
            } else if node.x > self.x {
                if let right = right {
                    right.addNode(node)
                } else {
                    node.parent = self
                    right = node
                }
            }
        }
        
        // 전위
        func preorder() -> [Int] {
            var arr: [Int] = []
            arr.append(index)
            
            if let left = left {
                arr += left.preorder()
            }
            if let right = right {
                arr += right.preorder()
            }
            return arr
        }
        // 후위
        func postorder() -> [Int] {
            var arr: [Int] = []
            if let left = left {
                arr += left.postorder()
            }
            if let right = right {
                arr += right.postorder()
            }
            arr.append(index)
            return arr
        }
    }
    
    var nodes = nodeinfo.enumerated().map { Node(index: $0+1, x: $1[0], y: $1[1]) }
    nodes.sort {
        if $0.y == $1.y {
            return $0.x < $1.x
        } else {
            return $0.y > $1.y
        }
    }
    nodes.forEach { print($0) }
    
    let root = nodes[0]
    
    for i in 1..<nodes.count {
        let node = nodes[i]
        root.addNode(node)
    }
    
    let result = [root.preorder(), root.postorder()]
//    print(result)
    return result
}


//solutionP42892([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]])
