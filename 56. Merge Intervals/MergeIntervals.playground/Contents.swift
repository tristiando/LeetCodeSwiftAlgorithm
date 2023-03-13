// https://leetcode.com/problems/merge-intervals/description/

class Solution {
    static func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        var results: [[Int]] = [sortedIntervals[0]]
        
        for i in sortedIntervals {
            if results.last![1] >= i[0] {
                let endIndex = results.endIndex
                results[endIndex - 1][1] = max(results[endIndex - 1][1], i[1])
            } else {
                results.append(i)
            }
        }
        
        return results
    }
}

let input1 = [[1,3],[2,6],[8,10],[15,18]], input2 = [[1,4],[0,4]], input3 = [[4,5],[1,4],[0,1]]
// expected: [[1,6],[8,10],[15,18]]
// [[0,4]]
// [[0,5]]
print(Solution.merge(input1))
print(Solution.merge(input2))
print(Solution.merge(input3))

