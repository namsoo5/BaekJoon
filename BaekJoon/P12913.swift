
import Foundation
// 땅따먹기
// dfs방식으로하면 시간초과...
// 반목문으로 변경후 문제-> 처음행부터 찾아가면 최대값을 찾기힘든 경우가존재
// 행의 합이 큰것부터 정렬후 찾아가기 -> 실패...
// dp로 접근
private func solutionP12913(_ land:[[Int]]) -> Int{
    var answer = 0
    var lands = land
    
    for r in 1..<land.count {
        lands[r][0] += max(lands[r-1][1],lands[r-1][2],lands[r-1][3])
        lands[r][1] += max(lands[r-1][0],lands[r-1][2],lands[r-1][3])
        lands[r][2] += max(lands[r-1][1],lands[r-1][0],lands[r-1][3])
        lands[r][3] += max(lands[r-1][1],lands[r-1][2],lands[r-1][0])
        
    }
    let last = land.count - 1
    answer = max(lands[last][0], lands[last][1], lands[last][2], lands[last][3])
    return answer
}

//print(solutionP12913([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
//print(solutionP12913([[1,2,3,5],[5,6,7,100],[4,3,2,1]]))
