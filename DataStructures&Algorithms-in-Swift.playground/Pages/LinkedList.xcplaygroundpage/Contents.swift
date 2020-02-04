//: [Previous](@previous)

import Foundation

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1)
}


example(of: "push") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    
    list.append(1)
    list.append(2)
    list.append(3)
    
    print(list)
}

example(of: "inserting at a particular index") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before inserting: \(list)")
    
    let middleNode = list.node(at: 1)!
    for _ in 1 ... 3 {
        list.insert(-1, after: middleNode)
    }
    print("After inserting: \(list)")
}


example(of: "pop") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}

example(of: "removing the last node") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    
    print("Before remove last node: \(list)")
    let removedValue = list.removeLast()
    print("After remove last node: \(list)")
    print("removed value: " + String(describing: removedValue))
}

example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing at particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    print("After removing at index \(index): \(list)")
    print("Removed value: " + String(describing: removedValue))
}


example(of: "using collection") {
    var list = LinkedList<Int>()
    
    for i in 0 ... 9 {
        list.append(i)
    }
    
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")
    
    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}


example(of: "array cow") {
    let array1 = [1, 2]
    var array2 = array1
    
    print("array1: \(array1)")
    print("array2: \(array2)")
    
    print("--- After adding 3 to array 2 ---")
    array2.append(3)
    print("array1: \(array1)")
    print("array2: \(array2)")
}


example(of: "linked list cow test") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    
//    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    var list2 = list1
//    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    
    print("list1: \(list1)")
    print("list2: \(list2)")
    
    print("--- After adding 3 to list 2 ---")
    list2.append(3)
    print("list1: \(list1)")
    print("list2: \(list2)")
}


example(of: "share nodes ") {
    var list1 = LinkedList<Int>()
    (1 ... 3).forEach { list1.append($0) }
    var list2 = list1
    
    list2.push(0)
    list1.push(100)
    
    print("list1: \(list1)")
    print("list2: \(list2)")
}

//: ___
//: #### Challenge 1：创建按照反向顺序打印链表元素的函数。

// 递归调用
private func printInReverse<T>(_ node: Node<T>?) {
    guard let node = node else {
        return
    }
    printInReverse(node.next)
    print(node.value)
}


func printInReverse<T>(_ list: LinkedList<T>) {
    printInReverse(list.head)
}

example(of: "printing in reverse") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    print("Printing in reverse: ")
    printInReverse(list)
}


//: ___
//: #### Challenge 2：创建返回链表中间节点值的函数。

func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var fast = list.head
    var slow = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    return slow
}


example(of: "getting the middle node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
       
    print("Original list: \(list)")
    if let middleNode = getMiddle(list) {
        print(middleNode.value)
    }
}

//: ___
//: #### Challenge 3：创建反转链表的函数。

example(of: "reverse the list solution 1") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    list.reverseSolutionOne()
    print("Reversed list: \(list)")
}

example(of: "reverse the list solution 2") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    list.reverseSolutionTwo()
    print("Reversed list: \(list)")
}


//: ___
//: #### Challenge 4：创建一个函数，该函数接收两个已排序的链表，并合并到单个排序的链表中。


func mergeSort<T: Comparable>(_ left: LinkedList<T>, _ right:LinkedList<T>) -> LinkedList<T> {
    // 检查输入的两个链表是否为空，如果其中一个为空，则直接返回另一个
    guard !left.isEmpty else {
        return right
    }
    guard !right.isEmpty else {
        return left
    }
    
    // 结果链表的head、tail定义
    var newHead: Node<T>?
    var tail: Node<T>?
    
    var currentLeft = left.head
    var currentRight = right.head
    // 检查left、right的首个节点，并将小的节点赋值给newHead
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    // 合并
    // 遍历left、right，尝试挑选能够加入新链表的节点，直到其中一个链表到达末尾节点
    while let leftNode = currentLeft, let rightNode = currentRight {
        // 比较节点值大小，并将小的链接到tail.next
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next
    }
    // 上个while循环同时以来currentLeft和currentRight，因此即使链表中还有节点，循坏也可能提前终止。需要将剩余的节点链接到处理单元中
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    // 创建结果链表，这里不使用push或者append的方式，而是直接指定链表的head、tail
    // head只有一个节点，直接复制，tail包含了很多节点，需要一个一个地进行链接
    var list = LinkedList<T>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    return list
}


example(of: "merging two sorted list") {
    var list1 = LinkedList<Int>()
    list1.push(3)
    list1.push(2)
    list1.push(1)
    
    var list2 = LinkedList<Int>()
    list2.push(-1)
    list2.push(-2)
    list2.push(-3)
    
    print("First list: \(list1)")
    print("Second list: \(list2)")
    let mergedList = mergeSort(list1, list2)
    print("Merged list: \(mergedList)")
}


//: ___
//: #### Challenge 5：创建从链表中删除特定元素的所有匹配项的函数。


example(of: "deleting duplicate nodes") {
    var list1 = LinkedList<Int>()
    list1.push(3)
    list1.push(2)
    list1.push(2)
    list1.push(2)
    list1.push(1)
    list1.push(1)
    
    print("Origin list: \(list1)")
    list1.removeAll(2)
    print("Delete duplicate list: \(list1)")
}

public struct Stack<Element> {
    private var storage: [Element] = []
    
//    public init(_ elements: [Element]) {
//        storage = elements
//    }
    
    // push
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // pop
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    // peek
    public func peek() -> Element? {
        return storage.last
    }
    
    // isEmpty
    public var isEmpty: Bool {
        return peek() == nil
    }
}

private func printInReverseNoRecursion<T>(_ list: LinkedList<T>) {
    var current = list.head
    var stack = Stack<T>()
    
    while let node = current {
        stack.push(node.value)
        current = node.next
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

example(of: "Print Linkedlist reverse without recursion") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    print("Printing in reverse: ")
    printInReverseNoRecursion(list)
}


func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            }else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}


example(of: "check parentheses") {
    let string = "h((e))llo(world)())"
    
    let result = checkParentheses(string)
    
    print("\(result)")
}


//: [Next](@next)
