//: [Previous](@previous)

import Foundation

final class BinaryNode<T> where T:Comparable {
  var data: T?
  var left: BinaryNode<T>?
  var right: BinaryNode<T>?
  
  init(data: T) {
    self.data = data
  }
}

final class Solution {
  func minimalTree(array: [Int]) -> BinaryNode<Int>?{
    
    return createMinimalArray(array: array, start: 0, end: array.count - 1)
  }
  
  func createMinimalArray(array: [Int], start: Int, end: Int) -> BinaryNode<Int>? {
    if (end < start) {
      return nil
    }
    let mid = (start + end) / 2
    
    let node = BinaryNode<Int>(data: array[mid])
    node.left = createMinimalArray(array: array, start: start, end: mid - 1)
    node.right = createMinimalArray(array: array, start: mid + 1, end: end)
    return node
  }
}

let array = [0, 1, 2, 3, 4,4, 5, 6, 7, 8]

let node = Solution().minimalTree(array: array)

//: [Next](@next)
