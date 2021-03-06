//: [Previous](@previous)

import Foundation


// Last in last out

final class Stack<T:Equatable> {
  
  final class StackNode<T> {
    var data: T
    var next: StackNode<T>?
    
    init(data: T, next: StackNode<T>? = nil) {
      self.data = data
      self.next = next
    }
  }
  
  var top: StackNode<T>?
  
  func push(_ item: T) {
    let node = StackNode<T>(data: item)
    if top == nil {
      top = node
      return
    }
    node.next = top
    top = node
  }
  
  func pop() -> T? {
    let popped = top?.data
    if top?.next != nil {
      top = top?.next
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

let stack =  Stack<Int>()
stack.peek() == nil
stack.push(1)
stack.push(2)
stack.push(3)
stack.pop() == 3
stack.pop() == 2
stack.pop() == 1

//: [Next](@next)
