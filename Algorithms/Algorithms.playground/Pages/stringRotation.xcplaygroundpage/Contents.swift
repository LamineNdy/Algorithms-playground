//: [Previous](@previous)

import Foundation


/*
 waterbottle -> elttobretaw
 waterbottle - > ttlewaterbo

 */

struct Solution {
  
  func rotated(_ s1: String, of s2: String) -> Bool {
    if s1.count != s2.count {
      return false
    }
    let xy = s1 + s1
    return isSubstring(s2, of: xy)
  }
  
  private func isSubstring(_ s1: String, of s2: String) -> Bool {
    return s2.contains(s1)
  }
  }

Solution().rotated("waterbottle", of: "erbottlewat") == true
Solution().rotated("waterbottle", of: "ttlewaterbo") == true
Solution().rotated("waterbottle", of: "ttlewo") == false
Solution().rotated("waterbottle", of: "ttlewaterba") == false
//: [Next](@next)
