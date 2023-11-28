public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var result = [Int]()
        var currentNode = root
        while currentNode != nil || !stack.isEmpty {
            if currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            } else {
                let node = stack.removeLast()
                result.append(node.val)
                currentNode = node.right
            }
        }
        return result
    }
}

let s = Solution()
print(s.inorderTraversal(TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))))
