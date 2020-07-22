//
//  6603.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/22.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 로또

private func solution6603() {
    while true {
        var input = readLine()!.components(separatedBy: .whitespacesAndNewlines).map{Int($0)!}
        let k = input.removeFirst()
        let arr = input
        
        if k == 0{
            return
        }
        // i: 배열요소, depth: 현위치, rs: 결과값
        func dfs(i: Int, depth: Int, rs: String) {
            
            if depth == 6 {
                print(rs)
                return
            }
            
            for j in i..<k {
                var result: String
                if rs == "" {
                    result = "\(arr[j])"
                } else {
                    result = "\(rs) \(arr[j])"
                }
                dfs(i: j+1, depth: depth+1, rs: result)
            }
            
        }
        
        dfs(i: 0, depth: 0, rs: "")
        print()
    }
}
