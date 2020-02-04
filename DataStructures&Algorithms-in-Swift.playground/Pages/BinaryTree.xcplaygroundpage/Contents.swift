//: [Previous](@previous)

import Foundation

var tree: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
}()


example(of: "tree diagram") {
    print(tree)
}

example(of: "in-order traversal") {
    tree.traverseInOrder {
        print($0)
    }
}

example(of: "pre-order traversal") {
    tree.traversePreOrder {
        print($0)
    }
}

example(of: "post-order traversal") {
    tree.traversePostOrder {
        print($0)
    }
}

example(of: "building a BST") {
    var bst = BinarySearchTree<Int>()
    for i in 0 ..< 5 {
        bst.insert(i)
    }
    print(bst)
}

var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

example(of: "building a balanced BST") {
    print(exampleTree)
}

example(of: "finding a node") {
    if exampleTree.containsOpt(5) {
        print("Found 5!")
    } else {
      print("Couldn't find 5")
    }
}

example(of: "removing a node") {
    var tree = exampleTree
    print("Tree before removal:")
    print(tree)
    tree.remove(3)
    print("Tree after removing root:")
    print(tree)
}

//: [Next](@next)
