//
//  socarCodeTest.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/23.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
/*
 3번
 rxr 해당경로에 [배달시간, 배달팁]이주어짐
 배달시간안에 배달한경우 배댤팁을 받을수있으며
 배달시간에 딱맞춰 도착하는경우에도 받을수잇음
 지나갓던경로를 다시지나갈수있으며
 이때 최대로 배달팁을 받는경우는?
 
 
 private func solution(_ r:Int, _ delivery:[[Int]]) -> Int {
     var result = 0
     var map = [[(sec: Int,tip: Int)]](repeating: [], count: r)
     var maxSecond = 0
     let emptyVisited = [Bool](repeating: false, count: delivery.count)
     
     delivery.forEach {
         if maxSecond < $0[0] {
             maxSecond = $0[0]
         }
     }
     for i in 0..<r {
         for j in 0..<r {
             map[i].append((delivery[i*r + j][0], delivery[i*r + j][1]))
         }
     }
     func bfs(x: Int, y: Int, tip: Int, second: Int, before: (Int, Int), visited: [Bool]) {
         var tip = tip
         var visited = visited
         if x < 0 || x >= r || y < 0 || y >= r || maxSecond < second {
             if result < tip {
                 result = tip
             }
             return
         }
         
         if map[y][x].sec >= second && !visited[y*r + x] {
             tip += map[y][x].tip
         }
         visited[y*r + x] = true
         if before.0 == x && before.1 == y+1 {
             bfs(x: x, y: y-1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x+1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x-1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
         } else if before.0 == x && before.1 == y-1 {
             bfs(x: x, y: y+1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x+1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x-1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
         } else if before.0 == x-1 && before.1 == y {
             bfs(x: x, y: y+1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x, y: y-1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x+1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
         } else if before.0 == x+1 && before.1 == y {
             bfs(x: x, y: y+1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x, y: y-1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x-1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
         } else {
             bfs(x: x, y: y+1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x, y: y-1, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x+1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
             bfs(x: x-1, y: y, tip: tip, second: second+1, before: (x,y), visited: visited)
         }
         
     }
     
     bfs(x: 0, y: 0, tip: 0, second: 0, before: (-1,-1), visited: emptyVisited)
     
     return result
 }
 solution(3, [[1, 5],[8, 3],[4, 2],[2, 3],[3, 1],[3, 2],[4, 2],[5, 2],[4, 1]])
 solution(4, [[1,10],[8, 1],[8, 1],[3, 100],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[9, 100],[8, 1],[8, 1],[8, 1]])

 */
/*2번

 #면 아래
 >면 오른쪽
 <면 왼쪽
 *면 아래 2번나오면 그자리에멈춤
 아래로 탈출하는경우는?
 
 func solution(_ drum:[String]) -> Int {
     var device: [[Character]] = []
     let maxSize = drum.count
     var curPos = (0,0)
     var meetStarCount = 0
     var arriveEndCount = 0
     
     for rowString in drum {
         device.append(rowString.map{ $0 })
     }
     
     func determineDirect(char: Character) {
         switch char {
         case "#":
             curPos = (curPos.0+1, curPos.1)
         case ">":
             curPos = (curPos.0, curPos.1+1)
         case "<":
             curPos = (curPos.0, curPos.1-1)
         case "*":
             if meetStarCount == 0 {
                 curPos = (curPos.0+1, curPos.1)
             }
             meetStarCount += 1
         default:
             break
         }
     }
     
     for column in 0..<maxSize {
         curPos = (0, column)
         meetStarCount = 0
         
         while true {
             if curPos.0 == maxSize || meetStarCount == 2 {
                 break
             }
             determineDirect(char: device[curPos.0][curPos.1])
             
         }
         if curPos.0 >= maxSize {
             arriveEndCount += 1
         }
     }
     
     return arriveEndCount
 }
 //print(solution(["######",">#*###","####*#","#<#>>#",">#*#*<","######"]))
 //print(solution(["#*#",">*#","##<"]))
 */
/* 1번
 n번타면 가격이 price * n임
 100원이라면
 1번에 100
 2번째에 200원
 3번째에 300원으로
 3번타면 600원을내야함
 주어진 돈이잇을때
 돈이 남는경우는0 모자라는경우를 출력하시오
 
func solution(_ price: Int, _ money: Int, _ count: Int) -> Int64 {
    var answer: Int64 = 0
    var totalMoney = 0
    
    (1...count).forEach{
        totalMoney += price * $0
    }
    answer = Int64(money - totalMoney)
    answer = answer < 0 ? -answer : 0
    return answer
}

print(solution(3, 20, 4))

*/
