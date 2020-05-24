//: [Previous](@previous)

import Foundation

final class Solution {
  func rotateMatrix(_  matrix: inout [[Int]]) -> Bool {
    
    // Check if the matrix cna be rotated
    if matrix.count == 0 || matrix.count != matrix[0].count { return false }
    
    // number of layer
    let numberOfLayer = matrix.count
    for layer in 0..<matrix.count/2 {
      let first = layer
      let last = numberOfLayer - 1 - first
      print("Layer \(layer)")
      
      for i in first..<last {
        print("element in layer [\(layer)] [\(i)]")
        let offset = i - first
        print("offset [\(offset)] ")
        // save top
        let top = matrix[first][i]
        
        // left -> top
        matrix[first][i] = matrix[last - offset][first]
        
        // bottom -> left
        matrix[last - offset][first] = matrix[last][last - offset]
        
        // right -> bottom
        matrix[last][last - offset] = matrix[i][last]
        
        // top -> right
        matrix[i][last] = top
      }
    }
    
    return true
  }
}

var array = [
  [2, 0],
  [3, 1]
]

Solution().rotateMatrix(&array)

array

struct Person {
  var name: String
  init(name: String) {
    self.name = name
  }
}

var str = "hello"
var str2 = str
let st3 = str
str += " word"
str
str2
st3

var p1 = Person(name: "Hey")
var p2 = p1
var p3 = p1
p1.name = "plop"
//p3.name = "Hi"
p1.name
p2.name
p3.name

//: [Next](@next)

