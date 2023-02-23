// https://leetcode.com/problems/longest-substring-without-repeating-characters

import Foundation

// O(n)
func lengthOfLongestSubstring(_ s: String) -> Int {
    let string = Array(s)
    var chars = Set<Character>()
    var (left, result) = (0, 0)

    for (right, c) in s.enumerated() {
        while chars.contains(c) {
            chars.remove(string[left])
            left += 1
        }

        chars.insert(c)
        result = max(result, right - left + 1)
    }

    return result
}

// expect: 3 ("wke")
print(lengthOfLongestSubstring("pwwkew"))
