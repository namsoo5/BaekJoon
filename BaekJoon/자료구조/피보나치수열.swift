//
//  피보나치수열.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/05/14.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func 동적피보나치(n: UInt) {
    var storage: [UInt: UInt] = [:]
    storage[1] = 1
    storage[0] = 0
    
    func fibo(n: UInt) -> UInt {
        
        if storage.keys.contains(n) {
            return storage[n]!
        }
        
        storage[n] = fibo(n: n-1) + fibo(n: n-2)
        return storage[n]!
    }
    
    print(fibo(n: n))
}
