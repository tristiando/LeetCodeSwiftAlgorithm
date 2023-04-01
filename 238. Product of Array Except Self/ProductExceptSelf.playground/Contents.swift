// https://leetcode.com/problems/product-of-array-except-self/description/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var arrLeft = [Int](), arrRight = [Int](), arrResult = [Int]()
        var leftValue = 1, rightValue = 1
        for i in 0..<n {
            leftValue *= nums[i]
            arrLeft.append(leftValue)
            
            rightValue *= nums[n - 1 - i]
            arrRight.insert(rightValue, at: 0)
        }
        
        for i in 0..<n {
            let left = (i - 1 >= 0) ? arrLeft[i - 1] : 1
            let right = (i + 1 <= n - 1) ? arrRight[i + 1] : 1
            let value = left * right
            arrResult.append(value)
        }
        
        return arrResult
    }
    
    func productExceptSelf2(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 1, count: n)
        var left = 1, right = 1
        
        for i in 0..<n {
            result[i] *= left
            left *= nums[i]
            
            result[n - 1 - i] *= right
            right *= nums[n - 1 - i]
        }
        
        return result
    }
}

let A = [1,2,3,4]
print(Solution().productExceptSelf2(A))

let B = [-1,1,0,-3,3]
print(Solution().productExceptSelf2(B))
