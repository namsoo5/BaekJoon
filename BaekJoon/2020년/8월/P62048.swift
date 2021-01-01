//
//  P62048.swift
//  BaekJoon
//
//  Created by 남수김 on 2020/08/30.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

// 윈터코딩 멀쩡한 사각형
//
// 비율로 계산해서 길이만큼 최소-최대길이의 사각형을 찾는것
// ->
// 최대공약수이용
// 비율안에는 w/gcd + h/gcd - 1만큼의 지나가는 사각형이존재
// 예를들어 w:8 h:12라면
// 2:3의 비율로 최대공약수는 4에해당한다
// 2*3의 범위안에 (2+3-1) 만큼의 지나가는 사각형이 존재하고
// 이범위를 최대공약수만큼의 배수이므로
// 즉 가로길이 + 세로길이 - 최대공약수가 지나가는 사각형의 갯수가 된다
private func solutionP62048(_ w:Int, _ h:Int) -> Int64{
    var answer: Int64 = 0
    var big = w > h ? w : h
    var small = big == w ? h : w
    
    var gcd = 0
    for _ in 0... {
        // 유클리드 호제법 최대공약수 알고리즘
        let remain = big%small
        if remain == 0 {
            gcd = small
            break
        }
        big = small
        small = remain
    }
    answer = Int64(w*h-(w+h-gcd))
    return answer
}
