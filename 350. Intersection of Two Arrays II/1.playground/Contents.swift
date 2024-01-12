// https://leetcode.com/problems/intersection-of-two-arrays-ii/description/

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict1 = [Int: Int]()
        for i in 0..<nums1.count {
            if let count = dict1[nums1[i]] {
                dict1[nums1[i]] = count + 1
            } else {
                dict1[nums1[i]] = 1
            }
        }
        
        var dict2 = [Int: Int]()
        for i in 0..<nums2.count {
            if let count = dict2[nums2[i]] {
                dict2[nums2[i]] = count + 1
            } else {
                dict2[nums2[i]] = 1
            }
        }
        
        let short = dict1.count <= dict2.count ? dict1 : dict2
        let long = dict1.count > dict2.count ? dict1 : dict2
        
        var intersection = [Int: Int]()
        let nums = short.keys.map { Int($0) }
        for num in nums {
            if let count = long[num] {
                intersection[num] = min(short[num]!, count)
            }
        }
        
        return intersection.flatMap { (key, value) in Array(repeating: key, count: value) }
    }
}

let s = Solution()
print(s.intersect([2,2,3,3,5], [2,3,4,3,2,9]))
print(s.intersect([4,9,5], [9,4,9,8,4]))


