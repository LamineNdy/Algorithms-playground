//: [Previous](@previous)

import Foundation

// Find the lefmost node (in-order of a given node)

final class BinaryNode<T> where T: Hashable {
  var data: T
  var left: BinaryNode<T>?
  var right: BinaryNode<T>?
  
  init(data: T) {
    self.data = data
  }
  
  // In order taversal until the end
  func findSuccesor() -> BinaryNode<T>? {
    if left {
      return left?.findSuccesor()
    } else {
      return self
    }
    return nil
  }
}


//: [Next](@next)
