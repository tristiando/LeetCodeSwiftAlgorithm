// Stack using Array
class Stack<T> {
    var items: [T] = []
        
    var isEmpty: Bool {
        items.isEmpty
    }
    
    func push(_ item: T) {
        items.append(item)
    }
    
    func pop() -> T? {
        return items.popLast()
    }
    
    func peek() -> T? {
        return items.last
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 != 1 else { return false }
        
        let characters = Array(s)
        let stack = Stack<Character>()
        let (openBrackets, closingBrackets) = ("([{", "}])")
        
        for c in characters {
            if openBrackets.contains(c) {
                stack.push(c)
            } else if closingBrackets.contains(c) {
                switch c {
                case ")":
                    if stack.peek() == "(" {
                        stack.pop()
                    } else {
                        return false
                    }
                case "]":
                    if stack.peek() == "[" {
                        stack.pop()
                    } else {
                        return false
                    }
                case "}":
                    if stack.peek() == "{" {
                        stack.pop()
                    } else {
                        return false
                    }
                default:
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

let solution = Solution()
print(solution.isValid("[["))
