import UIKit

struct Heap<T> {
    var elements: [T]
    var priorityFunction : (T, T) -> Bool
    
    init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        heapify()
    }
    
    mutating func heapify() {
        for i in (0..<count / 2).reversed() {
            bubbleDown(elementAtIndex: i)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    mutating func enqueue(_ el: T) {
        elements.append(el)
        bubbleUp(elementAtIndex: count - 1)
    }
    
    mutating func bubbleUp(elementAtIndex index: Int) {
        if isRoot(index) {
            return
        }
        let pIndex = self.parentIndex(of: index)
        if !isHigherPriority(at: index, than: pIndex) {
            return
        }
        self.swap(at: pIndex, and: index)
        bubbleUp(elementAtIndex: pIndex)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        swap(at: 0, and: elements.count - 1)
        let deq = elements.popLast()
        bubbleDown(elementAtIndex: 0)
        return deq
    }
    
    mutating func bubbleDown(elementAtIndex index: Int) {
        guard !isEmpty else {
            return
        }
        let highest = hightPriorityIndex(for: index)
        if highest == index {
            return
        }
        swap(at: highest, and: index)
        bubbleDown(elementAtIndex: index)
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return 2*index + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return 2*index + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    // return the highest Index between parent and child
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    // return highest priority element between parent and 2 children
    func hightPriorityIndex(for parent: Int) -> Int {
        let hightPriorityIndex = highestPriorityIndex(of: parent, and: leftChildIndex(of: parent))
        return highestPriorityIndex(of: hightPriorityIndex, and: rightChildIndex(of: parent))
    }
    
    mutating func swap(at firstIndex: Int, and secondIndex: Int ) {
        guard firstIndex != secondIndex else {
            return
        }
        elements.swapAt(firstIndex, secondIndex) // O(1)
    }
}

var heap = Heap(elements: [3, 2, 8, 5, 0], priorityFunction: >)
