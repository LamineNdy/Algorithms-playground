//: [Previous](@previous)

import Foundation

// Do only one edi

/*
 Example
 Pale -> Pal == true (insert e) -> traverse until last char, notice we missing the last one add it
 Ple -> Pale == true -> while traversing we can edit on the fly, but how do we now if we should insert/replace? should we do a first traversal?
 Paale -> Pale == true -> traverse first, check count, then replace add or remove
 
 Solution:
 Check count == same of count + 1
 if count == same -> replace
 //
 if count == +1 -> remove
 if count == -1 -> insert
 just check if the input is a substring of result
 */

final class Solution {
  func oneWay(_ input: String, _ target: String) -> Bool {
    if input == target { return true }
    if input.count == target.count {
      return oneReplaceWay(input, target)
    } else if input.count + 1 == target.count { // insert
      return oneWayEdit(input, target)
    } else if input.count - 1 == target.count { // remove
      return oneWayEdit(target, input)
    }
    return false
  }

  private func oneReplaceWay(_ input: String, _ target: String) -> Bool {
    var diff = false
    for i in 0 ..< input.count {
      if Array(input)[i] != Array(target)[i] {
        if diff { return false }
        diff = true
      }
    }
    print("input \(input) == \(target)")
    return true
  }
  
  private func oneWayEdit(_ s1: String, _ s2: String)-> Bool {
    var index1 = 0
    var index2 = 0
    while index2 < s2.count && index1 < s1.count {
      if Array(s1)[index1] != Array(s2)[index2] {
        if index1 != index2 {
          return false
        }
        index2 += 1
      } else {
        index1 += 1
        index2 += 1
      }
    }
    return true
  }
}

Solution().oneWay("pale","ple")
Solution().oneWay("pales","pale")
Solution().oneWay("pale","bale")
Solution().oneWay("pale","bake")
Solution().oneWay("pale","pales")

//: [Next](@next)
