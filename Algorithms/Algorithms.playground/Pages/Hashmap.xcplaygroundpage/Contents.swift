//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


//: Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
//: Let's assume the string is not sorted

do {
  
  final class Solution1 {
    /*
     0(n) worst case scenario juste storing each word in a dictionnary with a count
     When a count reach 2, break an return false
     */
    func isUnique(_ input: String) -> Bool {
      if input.isEmpty { return false }
      var charMap: [Character: Int] = [:]
      for char in input {
        if (charMap[char] != nil) {
          return false
        }
        charMap[char] = 1
      }
      return true
    }
    
  }
  Solution1().isUnique("Hello world") // false
  Solution1().isUnique("One") // true
}

//: Given two strings, write a method to decide if one is a permutation of the other


/*
 First condition of a permutation match is char match for both of the string
 Let's store the char count of each string and compare them later
 */
do {
  final class Solution {
    func checkPermutation(_ input1: String, _ input2: String) -> Bool {
      if input1.count != input2.count { return false }
      var charMap1: [Character: Int] = [:]
      for char in input1 {
        if charMap1[char] != nil {
          charMap1[char] = charMap1[char]! + 1
        } else {
           charMap1[char] = 1
        }
      }
      var charMap2: [Character: Int] = [:]
      for char in input2 {
        if charMap2[char] != nil {
          charMap2[char] = charMap2[char]! + 1
        } else {
          charMap2[char] = 1
        }
      }
      if charMap1 == charMap2 {
        return true
      }
      return false
    }
  }
  
  let l = Solution().checkPermutation("hello", "ollhe")
}


//: [Next](@next)
