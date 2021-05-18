//
//  LeetCode20210514.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 17:00 - 18:35
func solution_Flatten() {
    class TreeNode {
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
    
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(5)
    root.left?.left = TreeNode(3)
    root.left?.right = TreeNode(4)
    root.right?.right = TreeNode(6)
    
    // 이진트리 펼치기
    func flatten(_ root: TreeNode?) {
        if root?.left != nil {
            flatten(root?.left)
            // 트리 끝부터 올라오면서 트리변경
            
            // 왼쪽트리를 오른쪽으로이동
            let tempRight = root?.right
            root?.right = root?.left
            root?.left = nil
            
            // 왼쪽트리의 오른쪽끝과 오른쪽트리의 교체될 트리를 이어줌
            var childRight = root?.right
            while childRight?.right != nil {
                childRight = childRight?.right
            }
            childRight?.right = tempRight
        }
        
        if root?.right != nil {
            flatten(root?.right)
        }
    }
    
    flatten(root)
}

//solution_Flatten()


