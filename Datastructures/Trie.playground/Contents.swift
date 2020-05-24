import UIKit

//var str = "Hello, playground"

final class TrieNode {
  var c: Character
  var children: [TrieNode]// With a maxime of 26 characteres correspoonding to the alphabetical
  //var isWord: isWord
  var size = 0
  
  init(c: Character, children: [TrieNode]) {
    self.c = c
    self.children = children
  }
  
  static func getCharIndex(c: Character) -> Int {
    return c.al
  }
  
  private func getNode(c: Character) -> TrieNode? {
    self.children[TrieNode.getCharIndex(c: c)]
  }
  
  private func setNode(c: Character, node: TrieNode) {
    self.children[TrieNode.getCharIndex(c: c)] = node
  }
  
  func add(s: String, index: Int) {
    size += 1
    if index == s.count { return }
    let current = Array(s)[index]
    let charIndex = TrieNode.getCharIndex(c: current)
    var child = getNode(c: current)
    if child == nil {
      child = TrieNode(c: current, children: [])
      child?.add(s: s, index: index + 1)
    }
  }
  
  func findCount(s: String, index: Int) -> Int {
    if s.count == index {
      return size
    }
    
    var child = getNode(c: Array(s)[index])
    if child == nil {
      return 0
    }
    
    findCount(s: s, index: index + 1)
  }
  
  // If a word has children -> skip
  // if it's not a word, skp cause cannot delete a word not in the Tri
  func deleteWord(s: String) {
    
  }
  
}

public struct Vertex<T> : Equatable where T: Equatable, T: Hashable {

  public var data: T
  public let index: Int

}
