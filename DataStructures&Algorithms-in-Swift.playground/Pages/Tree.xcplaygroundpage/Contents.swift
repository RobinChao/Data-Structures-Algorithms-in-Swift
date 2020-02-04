//: [Previous](@previous)

import Foundation


example(of: "Create a tree") {
    let beverages = TreeNode("Beverages")
    let hot = TreeNode("Hot")
    let cold = TreeNode("Cold")
    
    beverages.add(hot)
    beverages.add(cold)
    
    beverages.forEachDepthFirst { (item) in
        print(item)
    }
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    
    let soda = TreeNode("sida")
    let milk = TreeNode("milk")
    
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    
    return tree
}

example(of: "depth-first traversal") {
    let tree = makeBeverageTree()
    tree.forEachDepthFirst {
        print($0.value)
    }
}


example(of: "level-order traversal") {
    let tree = makeBeverageTree()
    tree.forEachLevelOrder {
        print($0.value)
    }
}

example(of: "searching for a node") {
    let tree = makeBeverageTree()
    
    if let searchResult1 = tree.search("ginger ale") {
        print("Found node: \(searchResult1.value)")
    }
    
    if let searchResult2 = tree.search("WKD Blue") {
        print(searchResult2.value)
    } else {
      print("Couldn't find WKD Blue")
    }
}


func printEachLevel<T>(for tree: TreeNode<T>) {
    var queue = Array<TreeNode<T>>()
    var nodesLeftInCurrentLevel = 0
    queue.append(tree)
    
    while !queue.isEmpty {
        nodesLeftInCurrentLevel = queue.count
        while nodesLeftInCurrentLevel > 0 {
            guard let node = queue.isEmpty ? nil : queue.removeFirst()  else { break }
            print("\(node.value)", terminator: " ")
            node.children.forEach { queue.append($0) }
            nodesLeftInCurrentLevel -= 1
        }
        print()
    }
}

example(of: "Challenge") {
    let tree = makeBeverageTree()
    
    printEachLevel(for: tree)
}

//: [Next](@next)
