//: [Previous](@previous)

import Foundation

final class CustomStack<T:Equatable> {
  
  final class StackNode<T> {
    var data: T
    var next: StackNode<T>?
    
    init(data: T, next: StackNode<T>? = nil) {
      self.data = data
      self.next = next
    }
  }
  
  var top: StackNode<T>?
  private(set) var count: Int = 0
  
  func push(_ item: T) {
    let node = StackNode<T>(data: item)
    if top == nil {
      top = node
      return
    }
    node.next = top
    top = node
    count += 1
  }
  
  func pop() -> T? {
    let popped = top?.data
    if top?.next != nil {
      top = top?.next
    }
    if popped != nil {
     count -= 1
    }
    return popped
  }
  
  func peek() -> T? {
    return top?.data
  }
  
  
  func isEmpty() -> Bool {
    return top == nil
  }
}


final class StackOfPlate<T:Equatable> {
  var stackArray: [CustomStack<T>] = []
  var capacity: Int = 5
  
  func push(_ item: T) {
    if stackArray.isEmpty {
      let stack = CustomStack<T>()
      stack.push(item)
    } else {
      let stack = stackArray[stackArray.count - 1]
      if stack.count < capacity {
        stack.push(item)
      } else {
        let stack = CustomStack<T>()
        stack.push(item)
      }
    }
  }
  
  func pop() -> T? {
    if stackArray.isEmpty { return nil }
    let stack = stackArray[stackArray.count - 1]
    let poppped = stack.pop()
    if stack.count == 0 {
      stackArray.popLast()
    }
    return poppped
  }
  
  
}


//: [Next](@next)
