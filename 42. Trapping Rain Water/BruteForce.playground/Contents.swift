// https://leetcode.com/problems/trapping-rain-water/description/
// Solution: at each bar, we calculate the HEIGHT of the rain water:
// Imagine we have 3 bars: the current bar, its greatest bar to the left side (1), and its greatest bar to the right side (2).
// Then the HEIGHT will be the min of (1 and 2).
// The rain amount will be the HEIGHT - the bar.
// Time complexity: O(n2)

class Solution {
        
    static func trap(_ height: [Int]) -> Int {
        var res = 0
        
        for (i, bar) in height.enumerated() {
            let leftMax = height.prefix(upTo: i + 1).max()!
            let rightMax = height.suffix(from: i).max()!
            let rain = min(leftMax, rightMax) - bar
            res += rain
        }
        
        return res
    }
}
    
print(Solution.trap([0,1,0,2,1,0,1,3,2,1,2,1])) // expect: 6
//print(Solution.trap([4,2,0,3,2,5])) // expect: 9
