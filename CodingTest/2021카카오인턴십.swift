//
//  2021카카오인턴십.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/08.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func solution1(_ s:String) -> Int {
    
    let number: [String: String] = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    
    var result = ""
    var temp = ""
    let s = s.map{ String($0) }
    for c in s {
        if Int(c) != nil {
            result.append(c)
        } else {
            temp.append(c)
            if number.keys.contains(temp) {
                result.append(number[temp]!)
                temp = ""
            }
        }
    }
    
    return Int(result)!
}
//solution1("one4seveneight")
//solution1("23four5six7")
//solution1("2three45sixseven")
//solution1("123")

private func solution2(_ places:[[String]]) -> [Int] {
    
    func search(r: Int, c: Int, arr: [[String]], distance: Int, count: Int, visited: [[Bool]]) -> Bool {
        if distance > 2 {
            return true
        }
        if visited[r][c] {
            return true
        }
        
        var visited = visited
        visited[r][c] = true
//        print("r: \(r), c: \(c)")
        
        var count = count
        let word = arr[r][c]
        if word == "X" {
            return true
        }
        if word == "P" {
            count += 1
        }
        if count >= 2 {
            return false
        }
        
        var isTrue = true
        // 아래
        if r < arr.count - 1 {
            isTrue = isTrue && search(r: r+1, c: c, arr: arr, distance: distance+1, count: count, visited: visited)
        }
        // 위
        if r > 0 {
            isTrue = isTrue && search(r: r-1, c: c, arr: arr, distance: distance+1, count: count, visited: visited)
        }
        
        // 오른쪽
        if c < arr.count - 1 {
            isTrue = isTrue && search(r: r, c: c+1, arr: arr, distance: distance+1, count: count, visited: visited)
        }
        // 왼
        if c > 0 {
            isTrue = isTrue && search(r: r, c: c-1, arr: arr, distance: distance+1, count: count, visited: visited)
        }
        
        return isTrue
    }
    
    var result: [Bool] = []
    var testCase = (0..<5).map { _ in Array(repeating: "", count: 5) }
    let visited = (0..<5).map { _ in Array(repeating: false, count: 5) }
    for place in places {
        for (c, row) in place.enumerated() {
            for (i, s) in row.enumerated() {
                testCase[c][i] = String(s)
            }
        }
        
//        testCase.forEach { print($0) }
//        print("----")
//
        var isTrue = true
        for r in testCase.indices {
            for c in testCase.indices {
                if testCase[r][c] == "P" {
                    isTrue = isTrue && search(r: r, c: c, arr: testCase, distance: 0, count: 0, visited: visited)
//                    print(isTrue)
                }
            }
        }
        result.append(isTrue)
    }
    var numResult: [Int] = []
    result.forEach {
        let num = $0 ? 1 : 0
        numResult.append(num)
    }
    print(numResult)
    return numResult
}

//solution2([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"],
//           ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
//           ["PXOPX", "OXOXP", "OXPXX", "OXXXP", "POOXX"],
//           ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
//           ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])

//solution2([["OOOOO", "OOOOO", "OOOOO", "OOOOO", "OOOOO"],
//           ["XXXXX", "XXXXX", "XXXXX", "XXXXX", "XXXXX"],
//           ["PPPPP", "PPPPP", "PPPPP", "PPPPP", "PPPPP"],
//           ["XPXXX", "POXXX", "XXXXX", "XXXXX", "OOOOO"],
//           ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])

private func solution3(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var removeStack: [Int] = []
    var select = k
    var data: [Int] = (0..<n).map { $0 }
    var last = n
    let cmd = cmd.map { String($0) }
    
    func excute(c: String) {
        if c.count > 1 {
            let cmds = c.components(separatedBy: .whitespaces)
            let cmd = cmds[0]
            let num = Int(cmds[1])!
            
            if cmd == "U" {
                select -= num
                while data[select] == -1 {
                    select -= 1
                }
            } else {
                select += num
                while data[select] == -1 {
                    select += 1
                }
            }
        } else {
            if c == "C" {
                let remove = data[select]
                data[select] = -1
                last -= 1
                removeStack.append(remove)
                if last-1 <= select {
                    while data[select] == -1 {
                        select -= 1
                    }
                } else {
                    while data[select] == -1 {
                        select += 1
                    }
                }
            } else if c == "Z" {
                let restore = removeStack.removeLast()
                data[restore] = restore
                last += 1
            }
        }
    }
    
    for c in cmd {
//        print("c: \(c) select: \(select)")
//        print(data)
        excute(c: c)
//        print(data)
//        print("---")
    }
//
//    print(data)
    var result = ""
    for d in data {
        if d == -1 {
            result.append("X")
        } else {
            result.append("O")
        }
    }
    print(result)
    return result
}

//solution3(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"])
//solution3(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]    )

private func solution5(_ k:Int, _ num:[Int], _ links:[[Int]]) -> Int {
    if k == 1 {
        let result = num.reduce(0) { $0+$1 }
        return result
    }
    var nodes: [KakaoNode] = []
    for (i,value) in num.enumerated() {
        let node = KakaoNode(index: i, value: value)
        nodes.append(node)
    }
    
    for (i, link) in links.enumerated() {
        let left = link[0]
        let right = link[1]
        
        if left != -1 {
            nodes[i].left = nodes[left]
            nodes[left].parent = nodes[i]
        }
        if right != -1 {
            nodes[i].right = nodes[right]
            nodes[right].parent = nodes[i]
        }
    }
    
    var root: KakaoNode!
    for node in nodes {
        if node.parent == nil {
            root = node
            print(diagram(for: node))
        }
    }
    
    var roots: [KakaoNode] = [root]
    var group = 1
    var remainNode: KakaoNode = root
    
    func dfs(root: KakaoNode) {
        if group >= k {
            return
        }
        print("value: \(root.value)")
        var leftSum = 0
        if let left = root.left {
            leftSum = left.sum()
        }
        var rightSum = 0
        if let right = root.right {
            rightSum = right.sum()
        }
        if remainNode.sum() > root.sum() {
            dfs(root: remainNode)
            if group >= k {
                return
            }
        }
        
        remainNode = root
        if leftSum >= rightSum {
            if let left = root.left {
                group += 1
                roots.append(left)
                root.left = nil
                left.parent = nil
                dfs(root: left)
            }
        } else if leftSum < rightSum {
            if let right = root.right {
                group += 1
                roots.append(right)
                root.right = nil
                right.parent = nil
                dfs(root: right)
            }
        }
            
        if group < k {
            if let left = root.left {
                group += 1
                dfs(root: left)
                root.left = nil
                left.parent = nil
                roots.append(left)
            }
            if let right = root.right {
                group += 1
                dfs(root: right)
                root.right = nil
                right.parent = nil
                roots.append(right)
            }
        }
        
        return
    }
    
    dfs(root: root)
    var maxValue = 0
    roots.forEach {
        maxValue = max(maxValue, $0.sum())
    }
    print(maxValue)
    return maxValue
}

private class KakaoNode {
    let index: Int
    let value: Int
    var left: KakaoNode?
    var right: KakaoNode?
    var parent: KakaoNode?
    
    init(index: Int, value: Int) {
        self.index = index
        self.value = value
    }
    
    func sum() -> Int {
        var sum = 0
        sum += value
        if let left = left {
            sum += left.sum()
        }
        if let right = right {
            sum += right.sum()
        }
        return sum
    }
    
}
private func diagram(for node: KakaoNode?,
             _ top: String = "",
             _ root: String = "",
             _ bottom: String = "") -> String {
    guard let node = node else {
        return root + "nil\n"
    }
    if node.left == nil && node.right == nil {
        return root + "\(node.value)\n"
    }
    return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
}

//solution5(3, [12, 30, 1, 8, 8, 6, 20, 7, 5, 10, 4, 1],
//          [[-1, -1], [-1, -1], [-1, -1], [-1, -1], [8, 5], [2, 10], [3, 0], [6, 1], [11, -1], [7, 4], [-1, -1], [-1, -1]]) 40
//solution5(1, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) 27
//solution5(2, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) 14
//solution5(3, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) 13
//solution5(4, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) 9
