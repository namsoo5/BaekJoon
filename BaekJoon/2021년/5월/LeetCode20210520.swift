//
//  LeetCode20210520.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/20.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
//
//let root = TreeNode(3)
//root.left = TreeNode(9)
//root.right = TreeNode(20)
//root.right?.left = TreeNode(15)
//root.right?.right = TreeNode(7)

private func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    var dic: [Int: [Int]] = [:]
    
    if root == nil {
        return []
    }
    
    func levelCheck(root: TreeNode, level: Int) {
        if dic.keys.contains(level) {
            dic[level]?.append(root.val)
        } else {
            dic[level] = [root.val]
        }
        
        if let leftChild = root.left {
            levelCheck(root: leftChild, level: level+1)
        }
        if let rightChild = root.right {
            levelCheck(root: rightChild, level: level+1)
        }
    }
    
    levelCheck(root: root!, level: 0)

    var result: [[Int]] = []
    let sortDic = dic.sorted { $0.key < $1.key }
    for (_, values) in sortDic {
        result.append(values)
    }
    print(result)
    return result
}


//levelOrder(root)
