// Definition for singly-linked list from LeetCode.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        
        if list1!.val < list2!.val {
            list1!.next = mergeTwoLists(list1!.next, list2)
            return list1
        } else {
            list2!.next = mergeTwoLists(list2!.next, list1)
            return list2
        }
    }
}


let a = Solution().mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4))))
print(a)
