//
//  2022하이퍼커넥트인턴.swift
//  BaekJoon
//
//  Created by 남수김 on 2022/02/24.
//  Copyright © 2022 남수김. All rights reserved.
//

import Foundation

private func solution1(_ people:[Int]) -> [Int] {
    
    var store: [Int: Int] = [:]
    var result: [Int] = []
    for id in people {
        if store.keys.contains(id) {
            let couponCount = store[id] ?? 0
            if couponCount == 3 {
                store.removeValue(forKey: id)
                result.append(id)
                continue
            }
            
            store[id] = couponCount + 1
        } else {
            store[id] = 1
        }
    }
    
    if result.isEmpty {
        return [-1]
    }
    print(result)
    print(store)
    return result
}

//solution1([1,3,3,2,4,3,3,2,4,2,2,4])
//solution1([1,1,3,3,3,3,1,3,3,3,3,2])
//solution1([1,2,3,4])
//solution1([1,1,1,1])
//solution1([1])
//solution1([3,2,1,3,2,1,3,2,1,3])


private func solution2(_ n: Int) -> String {
    var ans:String = ""
    var store: [Int: Int] = [:]
    store[1] = 1
    store[0] = 0
    
    func fibo(n: Int) -> Int {
        if store.keys.contains(n) {
            return store[n]!
        }
        
        store[n] = fibo(n: n-1) + fibo(n: n-2)
        return store[n]!
    }
    
    func minusFibo(n: Int) -> Int {
        if store.keys.contains(n) {
            return store[n]!
        }
        store[n] = minusFibo(n: n+2) - minusFibo(n: n+1)
        return store[n]!
    }
    
    if n >= 0 {
        let num = fibo(n: n)
        ans = "\(num)"
    } else {
        let num = minusFibo(n: n)
        ans = "\(num)"
    }

    return ans
}

//solution2(1)
//solution2(-1)
//solution2(-3)
//solution2(-4)
//solution2(-5)
//solution2(0)
//solution2(3)
//solution2(5)



private func solution3(_ p:[String]) -> Int64 {
    var stack: [Int] = []
    for element in p {
        
        switch element {
        case "+":
            let num1 = stack.removeLast()
            let num2 = stack.removeLast()
            let newNum = num2 + num1
            stack.append(newNum)
        case "-":
            let num1 = stack.removeLast()
            let num2 = stack.removeLast()
            let newNum = num2 - num1
            stack.append(newNum)
        case "*":
            let num1 = stack.removeLast()
            let num2 = stack.removeLast()
            let newNum = num2 * num1
            stack.append(newNum)
        case "/":
            let num1 = stack.removeLast()
            let num2 = stack.removeLast()
            let newNum = num2 / num1
            stack.append(newNum)
        default:
            if let num = Int(element) {
                stack.append(num)
            }
        }
    }
    return Int64(stack[0])
}

//solution3(["12","2","5","+","*","9","3","/","-"])
//solution3(["1","1","+","1","1","+","*"])
//print(solution3(["3","4","+","7","*","2","*","4","2","/","/","7","/"]))


private func solution4(_ maps:[[Int]]) -> Int{
    var answer = 0
    
    var edgeValue: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: maps[0].count), count: maps.count)
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
    
    func searchGround(r: Int, c: Int) {
        if visited[r][c] {
            return
        }
        visited[r][c] = true
        
        var value = 4
        // 위검사
        if r > 0 && maps[r-1][c] == 1 {
            value -= 1
            searchGround(r: r-1, c: c)
        }
        // 아래검사
        if r < maps.count-1 && maps[r+1][c] == 1 {
            value -= 1
            searchGround(r: r+1, c: c)
        }
        // 왼쪽검사
        if c > 0 && maps[r][c-1] == 1 {
            value -= 1
            searchGround(r: r, c: c-1)
        }
        // 오른쪽검사
        if c < maps[r].count-1 && maps[r][c+1] == 1 {
            value -= 1
            searchGround(r: r, c: c+1)
        }
        edgeValue[r][c] = value
    }
    
    for row in maps.indices {
        for col in maps[row].indices {
            if maps[row][col] == 0 || visited[row][col] {
                continue
            }
            searchGround(r: row, c: col)
        }
    }
    
    for rows in edgeValue {
        for element in rows {
            answer += element
        }
    }
    
    return answer
}

//solution4([[0,0,1,0,0],[0,1,1,0,1],[0,0,1,0,1],[1,1,1,0,1]])
//solution4([[1,0,1,1],[0,0,1,1],[1,1,0,1],[1,1,0,0]])
//solution4([[1]])
//solution4([[1,0],[1,1]])
//solution4([[1,0],[0,1]])
//solution4([[1,1],[1,1]])
//solution4([[1,1,1],[1,0,1],[1,1,1]])
//solution4([[0,0,0],[0,0,1]])
