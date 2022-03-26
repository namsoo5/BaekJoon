//
//  v.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


private func solutionP12917(_ s:String) -> String {
    let newString: [String] = s.map{ String($0) }.sorted { $0 > $1 }
    return newString.joined()
}

//solutionP12917("Zbcdefg")
