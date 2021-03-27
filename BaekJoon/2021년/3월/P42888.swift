//
//  P42888.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/22.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation

// 21:45 - 22:00
// 오픈채팅방
private func solutionP42888(_ record:[String]) -> [String] {
    enum ExcuteType: String {
        case enter = "Enter"
        case leave = "Leave"
        case change = "Change"
    }
    
    // 아이디에 매칭되는 닉네임 저장
    var nicknameSet: [String: String] = [:]
    // 메시지 순서대로 저장
    var saveCommand: [(type: ExcuteType, id: String)] = []
    
    for r in record {
        let command = r.components(separatedBy: .whitespaces)
        let excute = ExcuteType(rawValue: command[0])
        switch excute {
        case .enter:
            let id = command[1]
            let nickname = command[2]
            nicknameSet[id] = nickname
            saveCommand.append((.enter, id))
        case .leave:
            let id = command[1]
            saveCommand.append((.leave, id))
        case .change:
            // 아이디에 매칭된 닉네임 변경
            let id = command[1]
            let nickname = command[2]
            nicknameSet[id] = nickname
        default:
            break
        }
    }
    
    var result: [String] = []
    for command in saveCommand {
        let nickname = nicknameSet[command.id]!
        if command.type == .enter {
            result.append("\(nickname)님이 들어왔습니다.")
        } else {
            result.append("\(nickname)님이 나갔습니다.")
        }
    }
//    print(result)
    return result
}

//solutionP42888(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
