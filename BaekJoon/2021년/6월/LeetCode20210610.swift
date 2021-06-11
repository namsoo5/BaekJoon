//
//  LeetCode20210610.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/06/11.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation


private class MyCalendar {
    private var startDate: [Int] = []
    private var endDate: [Int] = []
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        
        for i in startDate.indices {
            if startDate[i] < end && start < endDate[i]  {
                return false
            }
        }
        
        startDate.append(start)
        endDate.append(end)
        
        return true
    }
}

//let calendar = MyCalendar()
//print(calendar.book(25, 32))
//print(calendar.book(26, 35))
//print(calendar.book(19, 25))
