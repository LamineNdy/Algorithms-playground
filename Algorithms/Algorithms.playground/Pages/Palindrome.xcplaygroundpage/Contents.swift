//: [Previous](@previous)

import Foundation

/*
 Input type: 2 strings
 Output: Bool
 
 Example:
 
 True (permutations: "taco cat", "atco eta", etc.)
 Palindrome ->
 Anna
 0123 = 3210
 
 What is a palindrome:
 remove all non char
 Foward == backword
 Length == even -> each char occurence should be even
 Length == odd -> should have exactly one char occurence at odd that will be placed in the middle
 to resume a palindrom cannot have more than one odd char
 
 Solution1: (not efficient at all)
 get all the permutation 2n, then for each of them or on the fly check if it's a match to the input
 
 
 Solution2: ()
 use the def of the palindrom and check if there is more than one char number in odd
 if yes -> false
 if there is char number odd, check if the word count is odd too
 
 
 */


final class Solution {
  func palindrom_permutation(_ input: String) -> Bool {
    var charMap: [Character: Int] = [:]
    
    let trimmedInput = input
      .trimmingCharacters(in: CharacterSet.nonBaseCharacters)
      .replacingOccurrences(of: " ", with: "")
      .lowercased()
    
    for char in trimmedInput {
      print(char)
      charMap[char] = charMap[char] == nil ? 1 : charMap[char]! + 1
    }
    
    let oddOccCount = (charMap.filter {$0.value % 2 != 0}).count
    print("count \(charMap)")
    if oddOccCount == 0 && trimmedInput.count % 2 == 0 {
      return true
    } else if oddOccCount == 1 && trimmedInput.count % 2 != 0 {
      return true
    }
    print("count \(oddOccCount)")
    return false
  }
}

Solution().palindrom_permutation("Tact Coa") == true
Solution().palindrom_permutation("Anna") == true
Solution().palindrom_permutation("Ana") == true
Solution().palindrom_permutation("Animal loots foliated detail of stool lamina.") == true
//: [Next](@next)
