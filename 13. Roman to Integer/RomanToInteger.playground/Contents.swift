class Solution {
    func romanToInt(_ s: String) -> Int {
        var conversionTable = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000, "IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]
        var chars = Array(s)
        var sum = 0
        
        var i = 0
        while i < chars.count {
            var step = 1
            let c = chars[i]
            let j = i + 1
            if j < chars.count, let specialValue = conversionTable["\(c)\(chars[j])"] {
                    sum += specialValue
                    step = 2
                
            } else {
                let value = conversionTable["\(c)"]!
                sum += value
                step = 1
            }
            
            i += step
        }
        
        return sum
    }
}

let s = Solution()
print(s.romanToInt("III"))
print(s.romanToInt("LVIII"))
print(s.romanToInt("MCMXCIV"))
