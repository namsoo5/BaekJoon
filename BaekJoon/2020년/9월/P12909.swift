
import Foundation
// 올바른 괄호
private func solutionP12909(_ s:String) -> Bool
{
    var ans: Bool = true
    var openCount: Int = 0
    for element in s {
        if element == "(" {
            openCount += 1
           
        } else {
            openCount -= 1
            
            if openCount < 0 {
                return false
            }
        }
    }
    if openCount != 0 {
        ans = false
    }
    return ans
}
//
//solutionP12909("()()")
//solutionP12909("(())()")
//solutionP12909(")()(")
//solutionP12909("(()(")
