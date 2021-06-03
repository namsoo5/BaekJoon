//
//  LeetCode20210531.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/01.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

private func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
    let trie = TrieImpl()
    
    for product in products {
        trie.insert(word: product)
    }
    var result: [[String]] = []
    var search = ""
    for c in searchWord {
        search.append(c)
        let words = trie.search(prefix: search).sorted()
        
        if words.count > 3 {
            let w = words[0...2].map { String($0) }
            result.append(w)
        } else {
            result.append(words)
        }
    }
    print(result)
    return result
}

//suggestedProducts(["mobile","mouse","moneypot","monitor","mousepad"], "mouse")
//suggestedProducts( ["havana"], "havana")
//suggestedProducts( ["bags","baggage","banner","box","cloths"], "bags")
//suggestedProducts(["havana"], "tatiana")
