//
//  Extension+String.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/10/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

extension String {
    
    // ..< 경우
    subscript (range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    
    // ... 범위가 확실한 경우
    subscript (range: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start...end])
    }
    
    subscript (at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

extension String {
    
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

extension Character {
    
    func dropToInt(num: UInt8) -> UInt8 {
        return self.asciiValue! - num
    }
    
    func dropToChar(num: UInt8) -> Character {
        var value = self.asciiValue! - num
        if value < 97 {
            value += 26
        }
        return Character(UnicodeScalar(value))
    }
}
