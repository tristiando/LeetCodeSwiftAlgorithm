class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        
        if n == 2 {
            return 2
        }
        
        // save in dictionary to avoid calculating repeatedly the same values
        var dict = [Int: Int]()
        dict[1] = 1
        dict[2] = 2
        
        for i in 3...n {
            dict[i] = dict[i-1]! + dict[i-2]!
        }
        
        return dict[n]!
    }
}

let s = Solution()
print(s.climbStairs(1))
print(s.climbStairs(2))
print(s.climbStairs(3))
print(s.climbStairs(4))
print(s.climbStairs(45))
