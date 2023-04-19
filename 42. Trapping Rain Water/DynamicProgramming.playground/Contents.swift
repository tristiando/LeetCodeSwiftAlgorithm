// https://leetcode.com/problems/trapping-rain-water/description/
// Time complexity: O(n)

class Solution {
        
    static func trap(_ height: [Int]) -> Int {
        var res = 0
        
        var leftMax = Array(repeating: 0, count: height.count), rightMax = Array(repeating: 0, count: height.count)
        leftMax[0] = height[0]
        
        for i in 1..<height.count {
            leftMax[i] = max(height[i], leftMax[i - 1])
        }
        
        rightMax[height.count - 1] = height[height.count - 1]
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            rightMax[i] = max(height[i], rightMax[i + 1])
        }
        
        for i in 0..<height.count {
            res += min(leftMax[i], rightMax[i]) - height[i]
        }
        
        return res
    }
}
    
print(Solution.trap([0,1,0,2,1,0,1,3,2,1,2,1])) // expect: 6
print(Solution.trap([4,2,0,3,2,5])) // expect: 9
