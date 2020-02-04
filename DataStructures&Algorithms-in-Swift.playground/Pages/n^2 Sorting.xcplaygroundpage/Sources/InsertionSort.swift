import Foundation

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    
    for current in 1 ..< array.count {
        for shifting in (1 ... current).reversed() {
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            }else {
                break
            }
        }
    }
}


public func insertionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    
    for current in collection.indices {
        var shifting = current
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            shifting = previous
        }
    }
}
