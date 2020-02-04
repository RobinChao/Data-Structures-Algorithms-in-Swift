import Foundation


public class QueueLinkedList<T>: Queue {
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let _ = list.first else {
            return nil
        }
        return list.remove(at: 0)
    }
    
    public var peek: T? {
        return list.head?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
}


extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return String(describing: list)
    }
}
