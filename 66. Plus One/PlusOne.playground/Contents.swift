class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var newDigits = digits
        var index = digits.count - 1
        
        var carry = 1
        
        while index >= 0 {
            let newDigit = digits[index] + carry
            carry = 0
            if newDigit == 10 {
                newDigits[index] = 0
                carry = 1
                index = index - 1
            } else {
                newDigits[index] = newDigit
                return newDigits
            }
        }
        
        if carry == 1 {
            newDigits.insert(1, at: 0)
        }
        return newDigits
    }
}

let a = Solution()
print(a.plusOne([4,3,2,1]))
print(a.plusOne([9]))
print(a.plusOne([9,9]))

