import Foundation

public struct RingBuffer<T> {
    public var array: [T?]
    public var readIndex = 0
    public var writeIndex = 0
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public var availableSpaceForReading: Int {
      return writeIndex - readIndex
    }

    public var isEmpty: Bool {
      return availableSpaceForReading == 0
    }

    public var availableSpaceForWriting: Int {
      return array.count - availableSpaceForReading
    }

    public var isFull: Bool {
      return availableSpaceForWriting == 0
    }
    
    @discardableResult
    public mutating func write(_ element: T) -> Bool {
        guard !isFull else { return false }
        defer {
            writeIndex += 1
        }
        array[wrapped: writeIndex] = element
        return true
    }
    
    public mutating func read() -> T? {
        guard !isEmpty  else { return nil }
        defer {
            array[wrapped: readIndex] = nil
            readIndex += 1
        }
        return array[wrapped: readIndex]
    }
}

extension RingBuffer: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var index = readIndex
        return AnyIterator {
            guard index < self.writeIndex else { return nil }
            defer {
                index += 1
            }
            return self.array[wrapped: index]
        }
    }
}

private extension Array {
    subscript (wrapped index: Int) -> Element {
        get {
            return self[index % count]
        }
        set {
            self[index % count] = newValue
        }
    }
}
