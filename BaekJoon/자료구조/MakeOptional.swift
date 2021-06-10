//
//  MakeOptional.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/06.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

enum TestOptional<Wrap>: ExpressibleByNilLiteral, CustomDebugStringConvertible {
    
    var debugDescription: String {
        switch self {
        case .some(let value):
            return "Optional(\(value))"
        case .none:
            return "nil"
        }
    }
    
    case none
    case some(Wrap)
    
    init(_ some: Wrap) {
        self = .some(some)
    }
    
    init(nilLiteral: ()) {
        self = .none
    }
}
//let test: Int? = 1
//let test1 = Optional.some(1)
//let a = TestOptional(11)
//let b = TestOptional<Int>.some(11)
//let c = TestOptional<Int>.none
//let d = TestOptional<Int>(nilLiteral: ())
//print(test)
//print(test1)
//print(a)
//print(b)
//print(c)
//
//
//
