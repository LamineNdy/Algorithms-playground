import Foundation

var str = "Hello, playground"

// We could use an enum instead
class Node<T> {
  var data: T
  var children: [Node<T>]
  
  init(data: T, children: [Node<T>]) {
    self.data = data
    self.children = children
  }
}


final class BinaryNode<T: Comparable> {
  var data: T
  var left, right: BinaryNode<T>?
  
  init(data: T) {
    self.data = data
    
  }
  
  func insert(value: T) {
    if value <= data {
      if left == nil {
        left = BinaryNode<T>(data: value)
      } else {
        left?.insert(value: value)
      }
    } else {
      if right == nil {
        right = BinaryNode<T>(data: value)
      } else {
        right?.insert(value: value)
      }
    }
  }
  
  func contains(value: T) -> Bool {
    if value == data {
      return true
    }
    if let left = left {
      if data <= left.data{
        return left.contains(value: data)
      }
    }
    
    if let right = right {
      if data > right.data {
        return right.contains(value: data)
      }
    }
    return false
  }
  
  
  /// In order visitworkflow goes in that order
  /// left child first , then the node itself,
  /// then right child
  func visitInOrder() {
    if left != nil {
      left?.visitInOrder()
    }
    print(data)
    if right != nil {
      right?.visitInOrder
    }
  }
  
}
