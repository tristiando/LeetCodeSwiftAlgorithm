class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var dict = [Int:Int]()
        var expectedNums = [Int]()
        
        for (index, num) in nums.enumerated() {
            if dict[num] == nil {
                dict[num] = index
                expectedNums.append(num)
            }
        }
        nums = expectedNums
        return nums.count
    }
}
