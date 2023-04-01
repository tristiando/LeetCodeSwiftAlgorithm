class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
            var max = Int.min
            var maxHere = 0

            for i in 0..<nums.count {
                maxHere += nums[i]
                max = maxHere > max ? maxHere : max
                maxHere = maxHere < 0 ? 0 : maxHere
            }

            return max
        }
}

let A = [-2,1,-3,4,-1,2,1,-5,4]
print(Solution().maxSubArray(A))

let B = [5,4,-1,7,8]
print(Solution().maxSubArray(B))
