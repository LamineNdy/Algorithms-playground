//: [Previous](@previous)

import Foundation

final class Queue<T: Equatable> {
  
  final class QueueNode<T> {
    var data: T
    var next: QueueNode<T>?
    
    init(data: T, next: QueueNode<T>? = nil) {
      self.data = data
      self.next = next
    }
  }
  
  var first: QueueNode<T>?
  var last: QueueNode<T>?
  
  func add(_ data: T) {
    let node = QueueNode<T>(data: data)
    if last != nil {
      last?.next = node
    }
    last = node
    if first == nil {
      first = node
    }
    
  }

  func pop() -> T? {
    let data = first?.data
    first = first?.next
    if first == nil {
      last = nil
    }
    return data
  }
  
  func peek() -> T? {
    return first?.data
  }
  
  func isEmpty() -> Bool {
    return first == nil
  }
}

//: [Next](@next)

