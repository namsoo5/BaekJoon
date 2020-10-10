
import Foundation

// 가장 큰 정사각형 찾기
private func solutionP12905(_ board:[[Int]]) -> Int {
    var answer: Int = 0
    var board = board
    var max = 0
    // 현재 좌표로부터
    // 왼쪽, 왼쪽상단, 위
    // 만 검사하면 그사각형은 정사각형을 만족함
    board[0].forEach {
        if $0 == 1 {
            max = 1
        }
    }
    if max == 0 {
        board.forEach {
            if $0[0] == 1 {
                max = 1
            }
        }
    }
    
    for i in 1..<board.count {
        for j in 1..<board[0].count {
            if board[i][j] == 0 {
                continue
            }
            let value = min(board[i][j-1], board[i-1][j-1], board[i-1][j])
            if value != 0 {
                board[i][j] = value+1
                if max < board[i][j] {
                    max = board[i][j]
                }
            }
        }
    }
    
    answer = max * max
    return answer
}
//print(solutionP12905([[0,0,1,1],[1,1,1,1]]))
//print(solutionP12905([[1,2,3,4],[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))
//print(solutionP12905([[1],[0]]))
//print(solutionP12905([[1,1,1,0,0,1,1,1,1],[1,1,1,0,0,1,1,1,1],[1,1,1,0,0,1,1,1,1],[1,1,1,0,0,1,1,1,1]]))
//print(solutionP12905([[1, 1, 1, 1], [0, 1, 1, 1], [0, 1, 1, 1]]))
//print(solutionP12905([[1,1,1,0],[1,1,1,1],[1,1,1,1],[1,1,0,1]]))
//print(solutionP12905([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))
//print(solutionP12905([[0,0,1,1],[1,1,1,1]]))
//print(solutionP12905([[1,1,1],[1,0,1],[1,1,1]]))
//print(solutionP12905([[1,1,1,1]]))
//print(solutionP12905([[1,1],[1,1],[1,1],[1,1]]))
//print(solutionP12905([[0,0],[0,0],[0,0],[0,0]]))
