// https://leetcode.com/problems/longest-common-prefix/description/
import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class Solution {
    static func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }

        for i in 0..<strs[0].count {
            let c = strs[0][i]
            for j in 1..<strs.count {
                if strs[j].count == i || strs[j][i] != c {
                    let toIndex = strs[0].index(strs[0].startIndex, offsetBy: i)
                    return String(strs[0].prefix(upTo: toIndex))
                }
            }
        }
        
        return strs[0]
    }
}

print(Solution.longestCommonPrefix(["flower","flow","flight"])) // expect: "fl"
print(Solution.longestCommonPrefix(["dog","racecar","car"])) // expect: ""
