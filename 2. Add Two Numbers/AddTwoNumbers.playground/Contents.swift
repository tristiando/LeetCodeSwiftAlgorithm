// https://leetcode.com/problems/add-two-numbers/description/

import Foundation

class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    var description: String {
        return "\(val)" + (next != nil ? ", \(next!.description)" : "")
    }
}

class Solution {
    static func addTwoNumbers(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let result = ListNode(0)
        var (l1, l2, carry, pointer) = (list1, list2, 0, result)
        
        while l1 != nil || l2 != nil || carry > 0 {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum / 10
            
            pointer.next = ListNode(sum % 10)
            pointer = pointer.next!
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return result.next
    }
}

let list1 = ListNode(2, ListNode(4, ListNode(3)))
let list2 = ListNode(5, ListNode(6, ListNode(4)))
// expect 7 0 8
let result = Solution.addTwoNumbers(list1, list2)
print(result!)
