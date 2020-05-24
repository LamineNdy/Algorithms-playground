//: [Previous](@previous)

import Foundation

/*
  aabcccccaaa = 2ab4c3a
 
 abc = 1a1b1c = abc
 */

final class Solution {
  
  func compressed(_ input: String) -> String {
    if input.isEmpty { return input }
    var result = ""
    var charCount = 0
    var currentChar = Character(" ")
    for i in 0..<input.count {
      let char =  Array(input)[i]
      if char == currentChar {
        charCount += 1
      } else {
        appendResult(currentChar, charCount, in: &result)
        currentChar = char
        charCount = 1
      }
    }
    appendResult(currentChar, charCount, in: &result)
    return result.count < input.count ? result : input
  }
  
  private func appendResult(_ char: Character, _ count: Int, in result: inout String) {
    if count > 0 {
      result.append("\(char)\(count)")
    }
  }
  
}
  

Solution().compressed("aabcccccaaa") == "a2b1c5a3"
Solution().compressed("abc") == "abc"
Solution().compressed("aabcccccAAAppp") == "a2b1c5A3p3"

//: [Next](@next)
