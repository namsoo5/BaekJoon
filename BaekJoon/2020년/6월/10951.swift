//
//  10951.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/06/08.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation


private func solution10951() {
    while true {
        guard let input = readLine() else {
            return
        }
        
        guard let a = Int(input.components(separatedBy: .whitespaces)[0]) else {
            return
        }
        let b = Int(input.components(separatedBy: .whitespaces)[1])!
        
        print(a+b)
    }
}
