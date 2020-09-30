//
//  Trie.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/09/20.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

protocol TrieNode {
    associatedtype Node
    
    var value: String { get set }
    var children: [String: Node] { get set }
    var isFinal: Bool { get set }
    var data: String? { get set }
    /// 현재단어에 추가
    func add(value: String)
}


protocol Trie {
    /// 새단어 추가
    func insert(word: String)
    /// 단어검색
    func search(prefix: String) -> [String]
}

/// 단어를 가지고있을 노드
class TrieNodeImpl: TrieNode {
   
    var value: String
    var children: [String : TrieNodeImpl] = [:]
    var isFinal: Bool = false // 마지막단어가 있는 유무
    var data: String? // 마지막일때 최종데이터
    
    init(value: String) {
        self.value = value
    }
    
    func add(value: String) {
        let newNode = TrieNodeImpl(value: value)
        children[value] = newNode
    }

}


/// 트리구조로 단어 저장
class TrieImpl: Trie {
    
    let root: TrieNodeImpl
    
    init() {
        self.root = TrieNodeImpl(value: "")
    }
     
    /// 단어 추가
    func insert(word: String) {
        var node = root
        let wordArr = word.map { String($0) }
        
        for i in 0..<wordArr.count {
            let c = wordArr[i]
            if !node.children.keys.contains(c) {
                node.add(value: c)
            }
            node = node.children[c]!
        }
        node.isFinal = true
        node.data = word
    }
    
    /// 저장된 단어찾기
    /// - parameter preifx: 앞단어가 일치하는 단어찾기
    func search(prefix: String) -> [String] {
        var node = root
        let wordArr = prefix.map { String($0) }
        
        for c in wordArr {
            if node.children.keys.contains(c) {
                node = node.children[c]!
            } else {
                return []
            }
        }
        
        /// 남은 뒷단어 찾기
        func remainWord(node: TrieNodeImpl) -> [String] {
            let keys = node.children.keys.map{ String($0) }
            var result: [String] = []
            if node.isFinal {
                result.append(node.data!)
            }
            
            for key in keys {
                result += remainWord(node: node.children[key]!)
            }
            
            return result
        }
        let sortResult = remainWord(node: node).sorted()
        return sortResult
    }
}


/*

 let root = TrieImpl()

 let words = ["서울대", "서강대", "서서울대", "동국대", "가천대", "가만대", "동국초", "동국중", "서울대"]
 words.forEach {
     root.insert(word: $0)
 }

 print(root.search(prefix: ""))

 */
