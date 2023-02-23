// https://leetcode.com/problems/two-sum/

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var sum = 0
    for i in 0..<(nums.count - 1) {
        for j in (i + 1)..<nums.count {
            sum = nums[i] + nums[j]
            if sum == target {
                return [i, j]
            }
        }
    }
    return []
}

twoSum([2,7,11,15], 9)

// this solution uses a dictionary to save the index of the complement each number needs
func twoSum_O_n_Solution(_ nums: [Int], _ target: Int) -> [Int] {
    var complement: Int = 0
    var complementDict: [Int:Int] = [:]
    
    for (index, num) in nums.enumerated() {
        complement = target - num
        
        if complementDict[complement] != nil {
            return [complementDict[complement]!, index]
        } else {
            complementDict[num] = index
        }
    }
    return [-1, -1]
}

twoSum_O_n_Solution([2,7,11,15], 9)
