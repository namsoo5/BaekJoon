//
//  ProgrammersPrinter.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/17.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
// 프로그래머스 스택/큐 프린터문제
func solutionPrinter(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue = priorities
    var index = location
    var count = 0
    while true {
        let maxNum = queue.max()!
        let num = queue.removeFirst()
        if maxNum == num {
            count += 1
            if index == 0 {
                break
            }
        } else {
            queue.append(num)
        }
        
        index -= 1
        if index < 0 {
            index = queue.count-1
        }
        
        if queue.isEmpty {
            break
        }
    }
    return count
}
//print(solutionPrinter([2,1,3,2], 2))
//print(solutionPrinter([1,1,9,1,1,1], 0))

/*
 import Foundation
     var result = Queue<Int>()
     var temp = Queue<Int>()
     
     func solution(_ priorities:[Int], _ location:Int) -> Int {
         
         for e in priorities{
             temp.add(element: e)
         }
         
         temp.location = location
         
         while (temp.size() != 0){
             
             let e = temp.cyclePop()
             if temp.getMax() == e{
                 result.add(element: e)
                 if temp.remove(){
                     result.location = result.size()
                 }
             }
         }
         print(result)
 //        print(result.location)
         return result.location
     }
     




 struct Queue<T: BinaryInteger> {
     
     private var save = [T]()
     public init (){}
     var max = 0
     var location = 0
     
     mutating func add(element: T){
         self.save.append(element)
         
     }
     
     mutating func cyclePop()->T{
         //순환
         let first = save.remove(at: 0)
         self.save.append(first)
         
         location -= 1
         
         if location < 0 {
             location = save.count-1
         }
         
 //        print("locate: \(location)")
         return first
     }
     
     mutating func remove()->Bool{
        
         if location == save.count-1{
             save.removeLast()
             self.location = 999999
             return true
         }else{
             save.removeLast()
             return false
         }
     }
     
     mutating func getMax()->Int{
         self.max = self.save.max() as! Int
         return max
     }
     
     func size()->Int{
         return save.count
     }
 }
 */
