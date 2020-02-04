import Foundation


public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()
        // 创建新节点，没有尾节点，头节点和尾节点指向同一个新节点
        head = Node(value: value, next:head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()
        // 如果链表尾空，使用push操作新建节点，更新链表的头节点和尾节点。
        guard !isEmpty else {
            push(value)
            return
        }
        // 创建一个新节点，赋值为尾部节点的下一个节点，将节点连接起来。
        tail!.next = Node(value: value)
        // 因为是尾部拼接节点，所以新的节点将成为尾部节点
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        // 由于只能从头部遍历链表，因此先创建当前节点和索引的引用
        var currentNode = head
        var currentIndex = 0
        // 使用while循环，将引用向下移动到列表中，直到达到所需的索引。 空列表或越界索引将导致nil返回值。
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        // 如果要插入新节点的位置是尾节点，则直接使用append操作，添加新的尾节点
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        // 否则新建节点，并赋值为查找节点的下一个节点，将节点进行连接
        node.next = Node(value: value, next: node.next)
        
        return node.next!
    }
    
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        // 如果链表的头节点为nil，无节点移除，故返回nil
        // 这里也可以直接使用isEmpty进行判断
        guard let head = head else {
            return nil
        }
        // 如果链表仅有一个节点，头节点也是末尾节点，因此直接使用pop()操作即可
        guard head.next != nil else {
            return pop()
        }
        // 创建节点的引用
        var prev = head
        var current = head
        // 遍历链表节点，直到当前节点的下一个节点为nil，则表明当前节点已经是末尾节点了
        while let next = current.next {
            prev = current
            current = next
        }
        // 将当前节点的前一个节点的next指针值为nil，并更新末尾节点
        prev.next = nil
        tail = prev
        // 返回被删除的值
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        copyNodes()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    // COW
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOfNode = oldNode.next {
            newNode!.next = Node(value: nextOfNode.value)
            newNode = newNode!.next
            
            oldNode = nextOfNode
        }
        tail = newNode
    }
    
    // Reverse solution 1
    public mutating func reverseSolutionOne() {
        var tempList = LinkedList<Value>()
        for value in self {
            tempList.push(value)
        }
        head = tempList.head
    }
    
    // Reverse solution 2
    public mutating func reverseSolutionTwo() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
}

extension LinkedList where Value: Equatable {
    public mutating func removeAll(_ value: Value) {
        while let head = self.head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            prev = current
            current = current?.next
        }
        
        tail = prev
    }
}


extension LinkedList: Collection {
    // 自定义链表索引
    // 由于索引是一个可比较的对象，因此需要继承Comparable协议，并实现操作符==和<
    public struct Index: Comparable {
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    // 1
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    // 2
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
    // 3
    public var startIndex: Index {
        return Index(node: head)
    }
    // 4
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
}


extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty Linked List"
        }
        return String(describing: head)
    }
}
