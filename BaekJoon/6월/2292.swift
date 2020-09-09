//
//  2292.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/13.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
private func solution2292() {
    var origin = 1
    let distance = 6
    
    let input = Int(readLine()!)!
    
    for i in 0... {
        origin += distance * i
        if origin >= input {
            print("\(i+1)")
            return
        }
    }
}
