
import Foundation

// 단어를 비교후 다음문자열의 #유무를 판단하려 했으나 테스트케이스에서 예외처리를 생각하기 어려웠음
// 포함된 단어의 뒤의 한자리만 #비교할 때 비교단어와 전체단어가 문자열이 같으면 범위를 벗어나는 문제 발견

// 새로운 방법으로
// #붙은 단어를 다른 문자로 치환해서 생각

// 방금그곡
private func solutionP17683(_ m:String, _ musicinfos:[String]) -> String {
    var result: [(title: String, time: Int)] = []
    let m = m.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    
    for infoString in musicinfos {
        let music = infoString.components(separatedBy: ",")
        //        print(music)
        let start = music[0]
        let end = music[1]
        let title = music[2]
        let info = music[3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
            .map{String($0)}
        
        // 시간 계산
        let startTime = start.components(separatedBy: ":").map{Int($0)!}
        let startHour = startTime[0]
        let startMinute = startTime[1]
        let endTime = end.components(separatedBy: ":").map{Int($0)!}
        let endHour = endTime[0]
        let endMinute = endTime[1]
        let minute = (endHour - startHour) * 60 + endMinute - startMinute
        
        var fullInfo = ""
        for i in 0..<minute {
            let index = i % info.count
            fullInfo += info[index]
        }
        
        if fullInfo.contains(m) {
            result.append((title, minute))
        }
    }
//    print(result)
    print(result.max{$0.time < $1.time}?.title ?? "(None)")
    return result.max{$0.time < $1.time}?.title ?? "(None)"
}

//solutionP17683("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"])
//solutionP17683("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"])
//solutionP17683("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"])
//solutionP17683("ABC", ["12:00,12:14,HELLO,ABCC", "13:00,13:05,WORLD,ABCDEF"])
//solutionP17683("ABC", ["12:00,12:14,HELLO,C#C", "13:00,13:05,WORLD,CC"])
//solutionP17683("ABC", ["12:00,12:03,HELLO,ABC"])
//solutionP17683("ABC", ["12:00,12:03,HELLO,ABC", "12:00,12:03,NEXTHELLO,ABC"])
//solutionP17683("cdcdf", ["12:00,12:03,HELLO,ABAB")
