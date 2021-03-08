//
//  P67257_2.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/03.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 수식 최대화 카카오 인턴
private func solutionP67257(_ expression:String) -> Int64 {
   let priorities: [[Character]] = [["+","-","*"],
                   ["+","*","-"],
                   ["-","+","*"],
                   ["-","*","+"],
                   ["*","-","+"],
                   ["*","+","-"]]
   let operators = expression.filter { $0 == "+" || $0 == "-" || $0 == "*" }.map { String($0) }
   let numbers = expression.components(separatedBy: ["+","-","*"])
   var expressions: [String] = []
   for i in operators.indices {
       expressions.append(numbers[i])
       expressions.append(operators[i])
   }
   expressions.append(numbers.last!)
   var max = 0
   
   func calculate(op: Character, lhs: String, rhs: String) -> String {
       switch op {
       case "+":
           return String(Int(lhs)! + Int(rhs)!)
       case "-":
           return String(Int(lhs)! - Int(rhs)!)
       case "*":
           return String(Int(lhs)! * Int(rhs)!)
       default:
           return ""
       }
   }
   
   // 우선순위 임의로 정의한 리스트 순회
   for priority in priorities {
       var expression = expressions
//        print(priority)
       // 우선순위에 따른 값 검사
       for p in priority {
           var head = 0
           // head가 움직이면서 요소 검사
           while head < expression.count {
               if String(p) == expression[head] {
                   let lhs = expression[head-1]
                   let rhs = expression[head+1]
                   expression.removeSubrange(head...head+1)
                   expression[head-1] = calculate(op: p, lhs: lhs, rhs: rhs)
                   head = head-1
               } else {
                   head += 1
               }
           }
       }
       let result = abs(Int(expression.first!)!)
       max = max < result ? result : max
   }
   
//    print(max)
   return Int64(max)
}

//solutionP67257("100-200*300-500+20")
//solutionP67257("50*6-3*2")
