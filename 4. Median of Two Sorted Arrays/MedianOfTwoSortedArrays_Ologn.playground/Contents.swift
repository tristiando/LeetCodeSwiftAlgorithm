// https://leetcode.com/problems/median-of-two-sorted-arrays/description/
// refer: https://www.youtube.com/watch?v=LPFhl65R7ww


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count { // to ensure O(log_min(n,m))
            return findMedianSortedArrays(nums2, nums1)
        }
        var low = 0, high = nums1.count
        
        while low <= high {
            let partitionX: Int = (low + high) / 2
            let partitionY: Int = (nums1.count + nums2.count + 1) / 2 - partitionX
            
            let maxLeftX = partitionX == 0 ? Int.min : nums1[partitionX - 1]
            let minRightX = partitionX == nums1.count ? Int.max : nums1[partitionX]
            let maxLeftY = partitionY == 0 ? Int.min : nums2[partitionY - 1]
            let minRightY = partitionY == nums2.count ? Int.max : nums2[partitionY]
            
            if maxLeftX <= minRightY && maxLeftY <= minRightX {
                return (nums1.count + nums2.count) % 2 == 0
                    ? Double(max(maxLeftX, maxLeftY) + min(minRightX, minRightY)) / 2
                    : Double(max(maxLeftX, maxLeftY))
            } else if maxLeftX > minRightY {
                high = partitionX - 1
            } else {
                low = partitionX + 1
            }
        }
        
        return Double.infinity
    }
}

//let A = [1, 3, 4, 6, 9]
//let B = [2, 5, 7, 8, 10]
//print(Solution().findMedianSortedArrays(A, B))
//
//let C = [1, 3, 8, 9, 15]
//let D = [7, 11, 18, 19, 21, 25]
//print(Solution().findMedianSortedArrays(C, D))
//
//let E = [23, 26, 31, 35]
//let F = [3, 5, 7, 9, 11, 16]
//print(Solution().findMedianSortedArrays(E, F))

let G = [3, 5, 7, 9, 11, 16, 18, 19, 20]
let H = [6, 23, 26, 31, 35]
print(Solution().findMedianSortedArrays(G, H))
