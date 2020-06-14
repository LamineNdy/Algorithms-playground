//: [Previous](@previous)

import Foundation

final class BinaryNode<T> where T: Hashable {
  var data: T
  var left: BinaryNode<T>?
  var right: BinaryNode<T>?
  
  init(data: T, left: BinaryNode<T>? = nil, right: BinaryNode<T>? = nil) {
    self.data = data
    self.left = left
    self.right = right
  }
  
  /// Return the current height of the binary tree
  func getHeight() -> Int {
    if left == nil && right == nil {
      return 0
    }
    
    let leftDepth = left?.getHeight() ?? 0
    let rightDepth = right?.getHeight() ?? 0
    
    return max(leftDepth, rightDepth) + 1
  }
  
  
  /// Given a binary search tree, design an algorithm which created a array of all the nodes at each depth
  func getTrackedDepth() -> [Int: [BinaryNode<T>]] {
    var depthTracks: [Int: [BinaryNode<T>]] = [:]
    getTrackedDepth(depth: 0, tracks: &depthTracks)
    return depthTracks
  }
  
  private func getTrackedDepth(depth: Int, tracks: inout [Int: [BinaryNode<T>]]) {
    if left == nil && right == nil {
      return
    }
    
    if let left = left {
      if tracks[depth] == nil {
        tracks[depth] = [left]
      } else {
        tracks[depth]?.append(left)
      }
      left.getTrackedDepth(depth: depth + 1, tracks: &tracks)
    }
    
    if let right = right {
      if tracks[depth] == nil {
        tracks[depth] = [right]
      } else {
        tracks[depth]?.append(right)
      }
      right.getTrackedDepth(depth: depth + 1, tracks: &tracks)
    }
  }
  
  /// General rule to check if a tree is balanced -> Abs(left height - right height) <= 1
  func isBalanced() -> Bool {
    if left == nil && right == nil {
      return true
    }
    
    if abs((left?.getHeight() ?? 0) - (right?.getHeight() ?? 0)) > 1 {
      return false
    }
    // left and right could be checked separately
    return (left?.isBalanced() ?? true) && (right?.isBalanced() ?? true)
  }
}

var tree = BinaryNode<Int>(data: 0)
tree.right = BinaryNode<Int>(data: 0)
tree.left = BinaryNode<Int>(data: 0)
tree.left?.right = BinaryNode<Int>(data: 0)
tree.left?.left = BinaryNode<Int>(data: 0)
tree.right?.left = BinaryNode<Int>(data: 0)
tree.right?.right = BinaryNode<Int>(data: 0)
tree.right?.right?.right = BinaryNode<Int>(data: 0)
tree.right?.right?.right?.left = BinaryNode<Int>(data: 0)
tree.right?.right?.left?.left = BinaryNode<Int>(data: 0)

tree.getHeight()
let tracked = tree.getTrackedDepth()
tracked.count == 4
tracked[0]?.count == 2
tracked[1]?.count == 4
tracked[2]?.count == 1
tracked[3]?.count == 1
tree.isBalanced() == false

var balanced = BinaryNode<Int>(data: 0)
balanced.right = BinaryNode<Int>(data: 0)
balanced.left = BinaryNode<Int>(data: 0)

balanced.right?.right = BinaryNode<Int>(data: 0)
balanced.right?.left = BinaryNode<Int>(data: 0)

balanced.left?.right = BinaryNode<Int>(data: 0)
balanced.left?.left = BinaryNode<Int>(data: 0)

balanced.isBalanced() == true


//: [Next](@next)
