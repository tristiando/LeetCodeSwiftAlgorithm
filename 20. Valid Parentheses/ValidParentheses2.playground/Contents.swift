// https://leetcode.com/problems/valid-parentheses/description/
class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 { return false }
        var stack: [Character] = []
        for bracket in s {
            switch bracket {
               case "(":
                    stack.append(")")
                case "[":
                    stack.append("]")
                case "{":
                    stack.append("}")
                default:
                    if stack.isEmpty || stack.removeLast() != bracket {
                        return false
                    }
            }
        }
        return stack.isEmpty
    }
}

let solution = Solution()
let input1 = "[[", input2 = "()[]{}"
print("\(input1), \(solution.isValid(input1))")
print("\(input2), \(solution.isValid(input2))")
