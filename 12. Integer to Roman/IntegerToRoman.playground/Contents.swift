class Solution {
    func intToRoman(_ num: Int) -> String {
        var n = num
        var s = ""
        
        while n >= 900 {
            if n - 1000 >= 0 {
                n -= 1000
                s += "M"
            } else {
                n -= 900
                s += "CM"
            }
        }
        
        while n >= 400 {
            if n - 500 >= 0 {
                n -= 500
                s += "D"
            } else {
                n -= 400
                s += "CD"
            }
        }
        
        while n >= 90 {
            if n - 100 >= 0 {
                n -= 100
                s += "C"
            } else {
                n -= 90
                s += "XC"
            }
        }
        
        while n >= 40 {
            if n - 50 >= 0 {
                n -= 50
                s += "L"
            } else {
                n -= 40
                s += "XL"
            }
        }
        
        while n >= 9 {
            if n - 10 >= 0 {
                n -= 10
                s += "X"
            } else {
                n -= 9
                s += "IX"
            }
        }
        
        while n >= 4 {
            if n - 5 >= 0 {
                n -= 5
                s += "V"
            } else {
                n -= 4
                s += "IV"
            }
        }
        
        while n >= 1 {
            if n - 1 >= 0 {
                n -= 1
                s += "I"
            }
        }
        
        return s
    }
}

let s = Solution()
print(s.intToRoman(1994))
