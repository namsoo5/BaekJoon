//
//  MakeDictionary.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/11/10.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct MakeDictionary<Key, Value>: CustomDebugStringConvertible where Key: Hashable {
    var debugDescription: String {
        let temp = buckets.filter { $0.key != nil }
        temp.forEach { print($0) }
        return ""
    }

    struct Hash {
        var key: Key?
        var value: Value?
    }
    
    subscript (_ key: Key) -> Value? {
        set {
            guard let value = newValue else {
                return
            }
            let position = hash(key: key)
            buckets[position] = Hash(key: key, value: value)
            allIndex.append(position)
        }
        
        get {
            let position = hash(key: key)
            return buckets[position].value
        }
    }
    
    subscript () -> [Hash] {
        get {
            return buckets.filter { $0.key != nil }
        }
    }
    
    private let capacity: Int
    private var buckets: [Hash]
    var allIndex: [Int] = []
    private var current = 0
    
    var size: Int {
        return allIndex.count
        // buckets.filter { $0.key != nil }.count
    }
    
    var keys: [Key] {
        return allIndex.map { buckets[$0].key! }
        // buckets.filter { $0.key != nil }.compactMap {$0.key}
    }
    
    init(capacity: Int = 100000) {
        self.capacity = capacity
        self.buckets = Array<Hash>(repeating: Hash(key: nil, value: nil), count: capacity)
    }
    
    private func hash(key: Key) -> Int {
        abs(key.hashValue) % capacity
    }
}

extension MakeDictionary: Sequence, IteratorProtocol {
    
    typealias Element = Hash
    
    
    private mutating func makeIterator() -> MakeDictionary<Key, Value> {
        self.current = 0
        return self
    }
    
    mutating func next() -> Hash? {
        if current < allIndex.count {
            defer { current += 1}
            return buckets[allIndex[current]]
        }
        return nil
    }
}

//let tes: [Int: Int] = [:]
//
//var nsDic = MakeDictionary<Int, Int>()
//nsDic[1] = 10
//nsDic[2] = 20
//
//print("---nsDic---")
//print(nsDic)
//print("---size---")
//print(nsDic.size)
//print("---keys---")
//print(nsDic.keys)

//for item in nsDic {
//    print(item)
//}
