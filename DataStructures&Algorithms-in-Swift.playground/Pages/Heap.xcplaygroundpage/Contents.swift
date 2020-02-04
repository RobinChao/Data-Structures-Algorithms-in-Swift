//: [Previous](@previous)

import Foundation



example(of: "building a heap with array") {
    var heap = Heap(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7])
    
    while !heap.isEmpty  {
        print(heap.remove()!)
    }
}


example(of: "heap sort") {
    let heap = Heap(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7])
    print(heap.sorted())
}


//: [Next](@next)
