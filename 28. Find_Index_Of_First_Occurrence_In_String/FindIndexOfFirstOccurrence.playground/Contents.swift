class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var i = 0, j = 0
        let boundary = haystack.count - needle.count + 1
        
        while i < boundary {
            var t = 0
            while j < needle.count && needle[needle.index(needle.startIndex, offsetBy: j)] == haystack[haystack.index(haystack.startIndex, offsetBy: i + t)] {
                j += 1
                t += 1
            }
            
            if t == needle.count {
                return i
            } else {
                i += 1
                j = 0
            }
        }
        
        return -1
    }
}

let a = Solution()
a.strStr("hello", "ll")
a.strStr("sadbutsad", "sad")

