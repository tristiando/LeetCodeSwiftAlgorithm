// https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var i = 0, j = 0
        var mergedArray = [Int]()
        
        while i < nums1.count && j < nums2.count {
            if nums1[i] < nums2[j] {
                mergedArray.append(nums1[i])
                i += 1
            } else {
                mergedArray.append(nums2[j])
                j += 1
            }
        }
        
        mergedArray += nums1.suffix(from: i) + nums2.suffix(from: j)
        
        let count = mergedArray.count
        let median = count % 2 == 1 ? Double(mergedArray[count / 2]) : Double(mergedArray[count / 2 - 1] + mergedArray[count / 2]) / 2
        
        return median
    }
}
    
let num1 = [1, 2]
let num2 = [3, 4]
print(Solution.findMedianSortedArrays(num1, num2))
