// https://leetcode.com/problems/find-players-with-zero-or-one-losses/?envType=daily-question&envId=2024-01-15

class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        
        var neverLost = [Int: Int]()
        var lostOnce = [Int: Int]()
        var lostMany = [Int: Int]()
        
        for match in matches {
            let winner = match[0], loser = match[1]
            if lostMany[winner] == nil {
                if lostOnce[winner] == nil {
                    neverLost[winner] = 1
                }
            }
            
            if lostMany[loser] == nil {
                if lostOnce[loser] == nil {
                    lostOnce[loser] = 1
                    neverLost.removeValue(forKey: loser)
                } else {
                    let count = lostOnce[loser]!
                    lostOnce.removeValue(forKey: loser)
                    lostMany[loser] = count + 1
                }
            }
        }
        
       return [neverLost.keys.flatMap { $0 }.sorted(), lostOnce.keys.flatMap { $0 }.sorted()]
    }
}

let s = Solution()
print(s.findWinners([[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]))
