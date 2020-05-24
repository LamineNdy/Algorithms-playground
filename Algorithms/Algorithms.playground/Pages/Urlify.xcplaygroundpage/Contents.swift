//: [Previous](@previous)

import Foundation

//: Questions

/*
 "hello I am john Smith   "
 < - < - < - < - < - < -
 */
do {
  class Solution {
    func URLify(_ input: String) -> String {
      if input.count == 0 { return input }
      var result: [Character] = []
      var i = input.count - 1
      var started = false
      
      while i >= 0 {
        let char = Array(input)[i]
        if !started && char == " " {
          i -= 1
          continue
        }
        started = true
        if char == " " {
          result.append("0")
          result.append("2")
          result.append("%")
        } else {
          result.append(char)
        }
        print("here \(i)")
        i -= 1
        print("here + 1 \(i)")
      }
      
      return String(result.reversed())
    }
  }
  
  Solution().URLify("Hello Word, I am Mr smith    ") == "Hello%20Word,%20I%20am%20Mr%20smith"
  Solution().URLify("Mr John Smith    ") == "Mr%20John%20Smith"
  
}

//: [Next](@next)
