//: [Previous](@previous)

import Foundation

example(of: "Debug the Queue with Array") {
    var queue = QueueArray<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.dequeue()
    print(queue.peek ?? "")
}


example(of: "Debug the Queue with Doubly Linkedlist") {
    let queue = QueueLinkedList<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.dequeue()
    print(queue.peek ?? "")
}

//example(of: "The RingBuffer Test") {
//    var buffer = RingBuffer<Int>(count: 5)
//    buffer.array          // [nil, nil, nil, nil, nil]
//    buffer.readIndex      // 0
//    buffer.writeIndex     // 0
//    buffer.availableSpaceForReading // 0
//    buffer.availableSpaceForWriting // 5
//    buffer.write(123)
//    buffer.write(456)
//    buffer.write(789)
//    buffer.write(666)
//
//    buffer.array          // [{Some 123}, {Some 456}, {Some 789}, {Some 666}, nil]
//    buffer.readIndex      // 0
//    buffer.writeIndex     // 4
//    buffer.availableSpaceForReading // 4
//    buffer.availableSpaceForWriting // 1
//    buffer.read()         // 123
//    buffer.readIndex      // 1
//    buffer.availableSpaceForReading // 3
//    buffer.availableSpaceForWriting // 2
//    buffer.read()         // 456
//    buffer.read()         // 789
//    buffer.readIndex      // 3
//    buffer.availableSpaceForReading // 1
//    buffer.availableSpaceForWriting // 4
//    buffer.write(333)
//    buffer.write(555)
//    buffer.array          // [{Some 555}, {Some 456}, {Some 789}, {Some 666}, {Some 333}]
//    buffer.availableSpaceForReading // 3
//    buffer.availableSpaceForWriting // 2
//    buffer.writeIndex     // 6
//    buffer.read()         // 666
//    buffer.read()         // 333
//    buffer.read()         // 555
//    buffer.read()         // nil
//    buffer.availableSpaceForReading // 0
//    buffer.availableSpaceForWriting // 5
//    buffer.readIndex      // 6
//}

example(of: "Debug the Queue with RingBuffer") {
    var queue = QueueRingBuffer<String>(count: 10)
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.dequeue()
    print(queue.peek ?? "")
}

example(of: "Debug the Queue with Double Stack") {
    var queue = QueueStack<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    print(queue)
    queue.dequeue()
    print(queue)
    queue.dequeue()
    print(queue.peek ?? "")
}


//: [Next](@next)
