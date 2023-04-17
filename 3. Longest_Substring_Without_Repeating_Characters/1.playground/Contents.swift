// https://leetcode.com/problems/longest-substring-without-repeating-characters

import Foundation

// O(n). Sliding window technique
func lengthOfLongestSubstring(_ s: String) -> Int {
    let string = Array(s)
    var chars = Set<Character>()
    var (left, result) = (0, 0)

    for (right, c) in s.enumerated() {
        /**
         The purpose of this step is to ensure that we are always working with a substring that does not have any repeating characters. If a repeating character is encountered, it means that we have reached the end of the current substring, and we need to move the left pointer to the right until the substring no longer contains the repeating character.
         **/
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
