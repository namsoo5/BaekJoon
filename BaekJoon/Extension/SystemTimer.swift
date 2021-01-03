//
//  SystemTimer.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/01/01.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

func processTime(start: Date) {
        let processTime = Calendar.current.dateComponents([.nanosecond], from: start, to: Date()).nanosecond!
        print("\(Double(processTime)/1_000_000_000)sec")
}
