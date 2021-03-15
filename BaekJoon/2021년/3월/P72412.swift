//
//  P72412.swift
//  BaekJoon
//
//  Created by 남수김 on 2021/03/04.
//  Copyright © 2021 남수김. All rights reserved.
//

import Foundation
// 시작: 18:15, 종료: 18:44, 수정: 20:30
// 순위 검색
// 쿼리 10만개 정보 5만개 -> 2중첩시 시간초과 발생!
//
private func solutionP72412(_ info:[String], _ query:[String]) -> [Int] {
    var result: [Int] = []
    var db: [String: [Int]] = [:]
    
    // 정보에대한 모든 경우의 수 입력해놓기
    for s in info {
        let infos = s.components(separatedBy: .whitespaces)
        let languages = [infos[0], "-"]
        let jobs = [infos[1], "-"]
        let careers = [infos[2], "-"]
        let soulFoods = [infos[3], "-"]
        let score = Int(infos[4])!
        
        // 조합
        for lang in languages {
            for job in jobs {
                for career in careers {
                    for food in soulFoods {
                        let key = "\(lang) \(job) \(career) \(food)"
                        if db.keys.contains(key) {
                            db[key]?.append(score)
                        } else {
                            db[key] = [score]
                        }
                    }
                }
            }
        }
    }
    
    // 딕셔너리 점수순 재정렬
    for origin in db {
        let sortValue = origin.value.sorted()
        db[origin.key] = sortValue
    }
    
    // 쿼리를 키로 점수배열을 가져오고 점수배열을 이진탐색으로 효율적탐색 시도
    query.forEach {
        let excuteQuery = $0.components(separatedBy: .whitespaces)
        
        let lang = excuteQuery[0]
        let job = excuteQuery[2]
        let career = excuteQuery[4]
        let food = excuteQuery[6]
        let score = Int(excuteQuery[7])!
        
        let key = "\(lang) \(job) \(career) \(food)"
        if let matchScores = db[key] {
            // 이진 탐색
            var start = 0
            var end = matchScores.count
            while start < end {
                let mid = (start + end) / 2
                
                if matchScores[mid] >= score {
                    end = mid
                } else {
                    start = mid + 1
                }
            }
            print(matchScores)
            print("start: \(start) end: \(end) score: \(score)")
            result.append(matchScores.count - start)
            
        } else {
            result.append(0)
        }
        
    }
    print(result)
    return result
}

//solutionP72412(["java backend junior pizza 150",
//                "python frontend senior chicken 210",
//                "python frontend senior chicken 150",
//                "cpp backend senior pizza 260",
//                "java backend junior chicken 80",
//                "python backend senior chicken 50"],
//               ["java and backend and junior and pizza 100",
//                "python and frontend and senior and chicken 200",
//                "cpp and - and senior and pizza 250",
//                "- and backend and senior and - 150",
//                "- and - and - and chicken 100",
//                "- and - and - and - 150"])


private func 실패solutionP72412(_ info:[String], _ query:[String]) -> [Int] {
    var result: [Int] = []
    
    struct Info {
        enum DevLanguage: String {
            case java, cpp, python
        }
        enum Job: String {
            case backend, frontend
        }
        enum Career: String {
            case junior, senior
        }
        enum Food: String {
            case chicken, pizza
        }
        
        let language: DevLanguage
        let job: Job
        let career: Career
        let soulFood: Food
        let score: Int
        
        init(_ s: String) {
            let infos = s.components(separatedBy: .whitespaces)
            self.language = DevLanguage(rawValue: infos[0])!
            self.job = Job(rawValue:  infos[1])!
            self.career = Career(rawValue: infos[2])!
            self.soulFood = Food(rawValue: infos[3])!
            self.score = Int(infos[4])!
        }
        
        func matchInfo(lang: String, job: String, career: String, food: String, score: String) -> Bool {
            var matchLang = true
            
            if lang != "-" {
                matchLang = matchLang && DevLanguage(rawValue: lang) == self.language
                if !matchLang {
                    return false
                }
            }
            if job != "-" {
                matchLang = matchLang && Job(rawValue: job) == self.job
                if !matchLang {
                    return false
                }
            }
            if career != "-" {
                matchLang = matchLang && Career(rawValue: career) == self.career
                if !matchLang {
                    return false
                }
            }
            if food != "-" {
                matchLang = matchLang && Food(rawValue: food) == self.soulFood
                if !matchLang {
                    return false
                }
            }
            matchLang = matchLang && Int(score)! <= self.score
            
            return matchLang
        }
    }
    var db: [Info] = []
    info.forEach { db.append(Info($0)) }
    
    query.forEach {
        let excuteQuery = $0.components(separatedBy: .whitespaces)
        
        let lang = excuteQuery[0]
        let job = excuteQuery[2]
        let career = excuteQuery[4]
        let soulFood = excuteQuery[6]
        let score = excuteQuery[7]
        
        var matchCount = 0
        db.forEach {
//            print("\(lang), \(job), \(career), \(soulFood), \(score)")
            if $0.matchInfo(lang: lang, job: job, career: career, food: soulFood, score: score) {
                matchCount += 1
            }
        }
        result.append(matchCount)
    }
//    print(result)
    return result
}
