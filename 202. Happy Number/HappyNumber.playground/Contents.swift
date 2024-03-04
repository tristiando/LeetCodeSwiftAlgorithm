// https://leetcode.com/problems/happy-number/?envType=study-plan-v2&envId=top-interview-150

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var arrSum = [Int]()
        var currentNumber = n
        var currentSum = 0
        
        repeat {
            var t = currentNumber % 10
            while currentNumber > 0 {
                currentSum += t * t
                currentNumber = (currentNumber - t) / 10
                t = currentNumber % 10
            }
            
            if currentSum == 1 {
                return true
            }
            
            if arrSum.first(where: { $0 == currentSum}) != nil {
                return false
            }
            
            arrSum.append(currentSum)
            
            currentNumber = currentSum
            currentSum = 0
        } while currentNumber > 0
        
        return false
    }
}

let s = Solution()
print(s.isHappy(2))
print(s.isHappy(19))
