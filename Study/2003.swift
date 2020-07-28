//
//  2003.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/07/28.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private func solution2003() {
    let input = readLine()!.components(separatedBy: .whitespacesAndNewlines)
    let m = Int(input[1])!
    let arr = readLine()!.components(separatedBy: .whitespacesAndNewlines).map{Int($0)!}
    
    var result = 0
    var sum = 0
  
    func play(start: Int) {
        for i in start..<arr.count {
            sum += arr[i]
            
            if sum == m {
                result += 1
                sum = 0
                return play(start: start+1)
            } else if sum > m {
                sum = 0
                return play(start: start+1)
            }
        }
    }
    
    play(start: 0)
    print(result)
}
