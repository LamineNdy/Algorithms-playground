import Foundation

final class TrieNode {
  let char: Character
  var children: [Character: TrieNode]
  var isWord: Bool
  
  init(char: Character) {
    self.char = char
    self.children = [:]
    self.isWord = false
  }
  
  func addWord(_ word: String) {
    if word.isEmpty {
      return
    }
    // Get the first char
    let arrayString = Array(word)
    let firstChar = arrayString.first!
    var firstChildNode = child(firstChar)
    // Check if a node has been created
    if firstChildNode == nil {
      // if the node is missing we create one
      firstChildNode = TrieNode(char: firstChar)
      children[firstChar] = firstChildNode
    }
    // if it's the last char of the word we tag it as end of word
    // else just recurse to as more children
    if (word.count > 1) {
      firstChildNode?.addWord(String(word.dropFirst()))
    } else {
      firstChildNode?.isWord = true
    }
  }
  
  func child(_ c:Character) -> TrieNode? {
    return children[c]
  }
}

final class Trie {
  var root: TrieNode
  
  init(wordList: [String]) {
    root = TrieNode(char: "*")
    for w in wordList {
      root.addWord(w)
    }
  }
  
  func contains(prefix: String) -> Bool {
    return contains(prefix: prefix, exactWord: false)
  }
  
  private func contains(prefix: String, exactWord: Bool) -> Bool {
    /*
     * loop over the chars of the word and get the corresponding node for each of them
     * if the node happen to be nil, thats means the word is missing some part
     * if we get through the end, all the chars are found, we just need to check if it's a word
     */
    var lastNode: TrieNode? = root
    for char in Array(prefix) {
      lastNode = lastNode?.child(char)
      if lastNode == nil {
        return false
      }
    }
    
    return !exactWord || lastNode!.isWord
  }
}

var trie = Trie(wordList: [
  "cracking", "racking", "king", "something", "some"
])

trie.contains(prefix: "some") == true
trie.contains(prefix: "notHereAtAll") == false
trie.contains(prefix: "somed") == false
trie.contains(prefix: "king") == true



