//
//  MakeCOW.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/12/31.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

private class IntArrayBuffer {
    var storage: [Int]
    
    init() {
        storage = []
    }
    init(buffer: IntArrayBuffer) {
        storage = buffer.storage
    }
}

private struct IntArray {
    private var buffer: IntArrayBuffer
    
    init() {
        buffer = IntArrayBuffer()
    }
    
    // 데이터 변경이 일어나면 호출되고 참조가 하나인지 검사후 복사가 일어나서 새로운 인스턴스를 갖음
    private mutating func copyIfNeeded() {
        // 참조가 하나가 아니면
        if !isKnownUniquelyReferenced(&buffer) {
            // 새 인스턴스 생성
            buffer = IntArrayBuffer(buffer: buffer)
        }
    }
    
    mutating func insert(_ value: Int, at index: Int) {
        copyIfNeeded()
        buffer.storage.insert(value, at: index)
    }
}
