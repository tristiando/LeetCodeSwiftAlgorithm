class Solution {
    func romanToInt(_ s: String) -> Int {
        var value = 0
        var beforeN = ""
        for n in s {
            switch n {
                case "I": value += 1
                case "V": if beforeN == "I" { value += 3 } else { value += 5 }
                case "X": if beforeN == "I" { value += 8 } else { value += 10 }
                case "L": if beforeN == "X" { value += 30 } else { value += 50 }
                case "C": if beforeN == "X" { value += 80 } else { value += 100 }
                case "D": if beforeN == "C" { value += 300 } else { value += 500 }
                case "M": if beforeN == "C" { value += 800 } else { value += 1000 }
                default: value += 0
            }
            beforeN = String(n)
        }
        return value
    }
}

let s = Solution()
print(s.romanToInt("III"))
print(s.romanToInt("LVIII"))
print(s.romanToInt("MCMXCIV"))
