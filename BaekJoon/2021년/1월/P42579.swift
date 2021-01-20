//
//  P42579.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/17.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 베스트앨범
private func solutionP42579(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genreDic: [String: Int] = [:]
    var saveSong: [String: [(Int, Int)]] = [:]
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]
        
        if genreDic.keys.contains(genre) {
            genreDic[genre]! += play
        } else {
            genreDic[genre] = play
        }
        
        if saveSong.keys.contains(genre) {
            saveSong[genre]!.append((i, play))
        } else {
            saveSong[genre] = [(i, play)]
        }
        
    }
    
    let sortGenres = genreDic.sorted { $0.value > $1.value }
//    print(sortGenres)
//    print(saveSong)
    
    var result: [Int] = []
    for sortGenre in sortGenres {
        let genre = sortGenre.key
        var songList = saveSong[genre]
        songList?.sort { $0.1 > $1.1 }
        
        var count = 0
        for song in songList! {
            count += 1
            result.append(song.0)
            
            if count == 2 {
                break
            }
        }
    }
    
    print(result)
    return result
}

//solutionP42579(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])
