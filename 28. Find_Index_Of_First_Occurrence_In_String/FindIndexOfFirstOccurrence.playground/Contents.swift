class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var i = 0, j = 0
        let boundary = haystack.count - needle.count + 1
        
        let chars1 = Array(haystack)
        let chars2 = Array(needle)
        
        while i < boundary {
            var t = 0
            while j < chars2.count && chars2[j] == chars1[i + t] {
                j += 1
                t += 1
            }
            
            if t == chars2.count {
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

