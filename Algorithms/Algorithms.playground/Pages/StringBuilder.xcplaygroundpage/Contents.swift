//: [Previous](@previous)

import Foundation

class StringBuilder {
  var store: [String] = []
  
  func append(_ str: String ) {
    store.append(str)
  }
  
  func build() -> String {
//    return store.reduce("",+)
    return store.joined()
  }
}

var strBuilder = StringBuilder()
strBuilder.append("Hello")
strBuilder.append(" ")
strBuilder.append("word !")
print(strBuilder.build())

//: [Next](@next)
