// constraints of Roman integer: 1 <= num <= 3999
class Solution {
    func intToRoman(_ num: Int) -> String {
        return romanDigits[0][num / 1000]
        + romanDigits[1][(num % 1000) / 100]
        + romanDigits[2][(num % 100) / 10]
        + romanDigits[3][num % 10]
    }
    
    private let romanDigits: [[String]] = [
        ["", "M", "MM", "MMM"],
        ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
        ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
        ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    ]
}

let s = Solution()
print(s.intToRoman(1994))
