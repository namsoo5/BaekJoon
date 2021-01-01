//
//  10250.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/15.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
private func solution10250() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let 호텔층수 = input[0]
        let 각층방수 = input[1]
        let 손님순서 = input[2]
        
        var 뒷자리호수: Int
        var 앞자리호수 = 손님순서 % 호텔층수
        if 앞자리호수 == 0 {
            앞자리호수 = 호텔층수
            뒷자리호수 = 손님순서 / 호텔층수
        } else {
            뒷자리호수 = 손님순서 / 호텔층수 + 1
        }
        
        let result = "\(앞자리호수)\(String(format: "%02d", 뒷자리호수))"
        print(result)
    }
}


