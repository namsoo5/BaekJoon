//
//  12899.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/05.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

//124나라 숫자
private func solutionP12899(n: Int) {
    var n = n
    var result = ""
    while n > 0 {
        let remain = n%3
        n/=3
        if remain == 0 {
            n-=1
            result = "4\(result)"
        } else {
            result = "\(remain)\(result)"
        }
        
    }
    print("result: \(result)")
}
