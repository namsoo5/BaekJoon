//
//  MakeTree.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/04.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


// 트리 출력
private func diagram(for node: Node?,
             _ top: String = "",
             _ root: String = "",
             _ bottom: String = "") -> String {
    guard let node = node else {
        return root + "nil\n"
    }
    if node.left == nil && node.right == nil {
        return root + "\(node.index)\n"
    }
    return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.index)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
}

// 이진트리
private class Node {
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
