//
//  P81303.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/12/09.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

/// 테스트케이스 6개 시간초과
/// 2021카카오 채용연계 인턴십 표 편집
private func solutionP81303(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var selectedIndex = k {
        didSet {
            print("select: \(selectedIndex)")
        }
    }
    var arr = (0..<n).map { $0 } {
        didSet {
            print("arr: \(arr)")
        }
    }
    var trashWithIndex: [Int] = [] {
        didSet {
            print("trashWithIndex: \(trashWithIndex)")
        }
    }
    
    func process(cmd: String) {
        print("cmd: \(cmd)")
        let cmds = cmd.components(separatedBy: .whitespaces)
        let excute = cmds[0]
        
        switch excute {
        case "D":
            var count = Int(cmds[1])!
            for i in selectedIndex+1..<n {
                if arr[i] != -1 {
                    count -= 1
                }
                if count == 0 {
                    selectedIndex = i
                    break
                }
            }
        case "U":
            var count = Int(cmds[1])!
            for i in stride(from: selectedIndex-1, through: 0, by: -1) {
                if arr[i] != -1 {
                    count -= 1
                }
                if count == 0 {
                    selectedIndex = i
                    break
                }
            }
        case "C":
            let index = arr[selectedIndex]
            arr[selectedIndex] = -1
            trashWithIndex.append(index)
            
            var isFind = false
            for i in selectedIndex..<n {
                if arr[i] != -1 {
                    selectedIndex = i
                    isFind = true
                    break
                }
            }
            if !isFind {
                for i in stride(from: selectedIndex, through: 0, by: -1) {
                    if arr[i] != -1 {
                        selectedIndex = i
                        break
                    }
                }
            }
        case "Z":
            let restore = trashWithIndex.removeLast()
            arr[restore] = restore
        default:
            return
        }
    }
    
    print(arr)
    
    for c in cmd {
        process(cmd: c)
        print("-------")
    }
    
    var result = ""
    for i in 0..<n {
        if arr[i] == i {
            result.append("O")
        } else {
            result.append("X")
        }
    }
    
    print(result)
    return result
}

//solutionP81303(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"])
//solutionP81303(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"])
//solutionP81303(10, 5, ["C","C","C","C","C","C","U 2","C","C","C","Z","Z","Z","Z","Z","D 5"])

//solutionP81303(4, 0, ["C","D 1","C","C","Z","Z","C"])
