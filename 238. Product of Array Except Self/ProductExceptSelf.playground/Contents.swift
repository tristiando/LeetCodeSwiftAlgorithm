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
}

let A = [1,2,3,4]
print(Solution().productExceptSelf(A))

let B = [-1,1,0,-3,3]
print(Solution().productExceptSelf(B))
