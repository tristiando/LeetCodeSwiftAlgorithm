import Cocoa

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let cleanChars = Array(getAlphaNumericValue(s))
        
        let n = cleanChars.count
        
        guard n > 1 else { return true }
        
        var i = 0, j = n - 1
        while i <= (n - 1) / 2 {
            if cleanChars[i] != cleanChars[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    func getAlphaNumericValue(_ s: String) -> String {
        var cleanString = s.lowercased().filter { !$0.isWhitespace }
        
        let unsafeChars = CharacterSet.alphanumerics.inverted  // Remove the .inverted to get the opposite result.
        
        cleanString  = cleanString.components(separatedBy: unsafeChars).joined(separator: "")
        
        
        print(cleanString)  // 123456789AnyThingYouWant
        return cleanString
    }
}

let solution = Solution()
print(solution.isPalindrome("A man, a plan, a canal: Panama")) // expect: true
print(solution.isPalindrome("race a car")) // expect: false
