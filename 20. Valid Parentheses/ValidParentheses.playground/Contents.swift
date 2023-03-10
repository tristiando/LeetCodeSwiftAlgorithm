// Stack using Array
class Stack<T> {
    var items: [T] = []
        
    var description: String {
        items.map { "\($0)" }.joined(separator: " ")
    }
    
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
        
        for c in characters {
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
                stack.push(c)
            }
        }
        return stack.isEmpty
    }
}

let solution = Solution()
let input1 = "[[", input2 = "()[]{}"
print("\(input1), \(solution.isValid(input1))")
print("\(input2), \(solution.isValid(input2))")
