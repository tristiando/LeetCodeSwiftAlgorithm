// Definition for singly-linked list from LeetCode.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newList: ListNode? = nil
        var current = head
        
        while (current != nil) {
            let nextNode = current?.next
            current?.next = newList
            newList = current
            current = nextNode
        }
        return newList
    }
}
