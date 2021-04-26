//
//  P17681.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/04/20.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 비밀지도
private func solutionP17681(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    func convertRadix(num1: Int, num2: Int) -> String {
        let wall = num1 | num2
        let radixString = String(wall, radix: 2, uppercase: false)
        let radixInt = Int(radixString, radix: 10)!
        let string = String(format: "%0\(n)ld", radixInt)
        return string
    }
     
    for i in arr1.indices {
        let newString = convertRadix(num1: arr1[i], num2: arr2[i])
        
        var temp = ""
        newString.forEach {
            temp += ($0 == "1") ? "#" : " "
        }
        answer.append(temp)
    }
    print(answer)
    return answer
}

//solutionP17681(5, [9,20,28,18,11], [30,1,21,17,28])
//solutionP17681(6, [46,33,33,22,31,50], [27,56,19,14,14,10])
//solutionP17681(1, [1], [0])
