class LinkedListNode {
    let key: Int
    let value: Int
    var next: LinkedListNode? = nil
    var prev: LinkedListNode? = nil
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    let capacity: Int
    var hashmap = [Int: LinkedListNode]()
    var headNode: LinkedListNode? = nil
    var tailNode: LinkedListNode? = nil
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let item = hashmap[key] else { return -1 }
        if headNode?.key != key {
            removeFromLinkedList(item)
            insertNewHead(item)
        }
        return item.value
    }
    
    func put(_ key: Int, _ value: Int) {
        
        removeKey(key)
        
        if hashmap.count >= capacity, let node = tailNode {
            removeKey(node.key)
        }
        
        let newNode = LinkedListNode(key, value)
        insertNewHead(newNode)
        hashmap[key] = newNode
    }
    
    func removeKey(_ key: Int) {
        let node = hashmap[key]
        removeFromLinkedList(node)
        hashmap.removeValue(forKey: key)
    }
    
    func removeFromLinkedList(_ input: LinkedListNode?) {
        guard let item = input else { return }
        
        if item.prev != nil {
            item.prev?.next = item.next
        }
        
        if item.next != nil {
            item.next?.prev = item.prev
        }
            
        if item.key == headNode?.key {
            headNode = item.next
        }
        
        if item.key == tailNode?.key {
            tailNode = item.prev
        }
    
        item.prev = nil
        item.next = nil
    }
    
    func insertNewHead(_ item: LinkedListNode) {
        guard headNode != nil else {
            headNode = item
            tailNode = item
            return
        }
        
        headNode?.prev = item
        item.next = headNode
        headNode = item
    }
}

