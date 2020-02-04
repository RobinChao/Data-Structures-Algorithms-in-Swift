//: [Previous](@previous)

import Foundation

example(of: "priorityQueue") {
    var priorityQueue = PriorityQueue(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7])
    while !priorityQueue.isEmpty {
        print(priorityQueue.dequeue()!)
    }
}

//: [Next](@next)
