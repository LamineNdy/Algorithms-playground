//: [Previous](@previous)

import Foundation

class TreeNode {
  var val: Int
  var left: TreeNode?
  var right: TreeNode?
  init() { self.val = 0; self.left = nil; self.right = nil; }
  
  init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  
  init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

// Check BST id node are in the left range or right range
class Solution {
  func isValidBST(_ root: TreeNode?) -> Bool {
    return checkBst(root, Int.min, Int.max)
  }
  
  func checkBst(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
    // Root nil means we are at the end of the tree
    if root == nil {
      return true
    }
    //Check if value us un the range between min and max
    if (root!.val < min || root!.val > max) {
      return false
    }
    // Check left node is in [min; root.val - 1] and right node is in [root.val + 1, max]
    return checkBst(root?.right, min, root!.val - 1) && checkBst(root?.right, root!.val + 1 ,max)
  }
}

//: [Next](@next)

