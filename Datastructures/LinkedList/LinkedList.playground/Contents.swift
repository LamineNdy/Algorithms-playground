//: [Previous](@previous)

import Foundation

final class Node<T: Equatable> {
  var data: T
  var next: Node<T>?
  
  init(_ data: T) {
    self.data = data
  }
  
}

final class LinkedList<T: Equatable> {
  var head: Node<T>?
  
  func append(_ data: T) {
    if head == nil {
      head = Node<T>(data)
      return
    }
    
    var current = head
    while current?.next != nil {
      current = current?.next
    }
    current?.next = Node<T>(data)
  }
  
  func prepend(_ data: T) {
    let newHead = Node<T>(data)
    newHead.next = head
    head = newHead
  }
  
  func delete(_ data: T) {
    if head == nil { return }
    
    if head?.data == data {
      head = head?.next
      return
    }
    var current = head
    while current?.next != nil {
      if current?.next?.data == data {
        current?.next = current?.next?.next
        return
      }
      current = current?.next
    }
  }
  
  func contains(_ data: T) -> Bool {
    if head == nil { return false }
    var current = head
    while current?.next != nil {
      if current?.data == data {
        return true
        }
      current = current?.next
    }
    return false
  }
  
  func hasCycle() -> Bool {
    if head == nil { return false }
    var slow = head
    var fast = head?.next
    
    while fast != nil && fast?.next != nil{
        if fast?.data == slow?.data {
          return true
        }
      slow = slow?.next
      fast = fast?.next?.next
    }
    return false
  }
  
  func removeDups() {
    if head == nil { return }
    var slow = head
    var fast = head?.next
    
    while fast != nil && fast?.next != nil{
      if fast?.next?.data == slow?.next?.data {
        slow?.next = slow?.next?.next
        }
      slow = slow?.next
      fast = fast?.next?.next
    }
  }
  
  // Time O(n) and space: O(1)
  static func reversed(head: Node<T>?) -> Node<T>? {
    // Init pointer
    var previous: Node<T>?
    var current = head
    var next: Node<T>?
    
    while current != nil {
      // save next
      next = current?.next
      // Reverse
      current?.next = previous
      // Advance
      previous = current
      current = next
    }
    return previous
  }
  
  // Time and space: O(n)
  func recursiveReverse(head: Node<T>?) -> Node<T>?  {
    // base case
    if (head == nil || head?.next == nil) {
      return head
    }
    // Go down
    let reversedLinkedList = recursiveReverse(head: head?.next)
    // Reverse
    head?.next?.next = head
    head?.next = nil // this ensures that you point the last node in the reversed portion (built slowly as we go upwards in the recursion) to null.
    // Go back up
    return reversedLinkedList
  }
}


var list = LinkedList<Int>()
list.append(6)
list.append(7)
list.append(10)
list.append(15)
list.append(16)
list.contains(10) == true
list.delete(10)
list.contains(10) == false
list.contains(15) == true
list.contains(7) == true
list.hasCycle() == false
list.append(16)
list.append(16)
list.hasCycle() == true



struct Solution2_4{
  func partition(_ node: Node<Int>, with partition: Int) -> Node<Int> {
    var nodeTmp: Node<Int>? = node
    var head : Node<Int>? = node
    var tail : Node<Int>? = node
 
    while nodeTmp != nil {
      let next = nodeTmp?.next
      if nodeTmp?.data != nil && nodeTmp!.data < partition {
        nodeTmp?.next = nodeTmp
        head = nodeTmp
      } else {
        nodeTmp?.next = nodeTmp
        tail = nodeTmp
      }
      nodeTmp = next
    }
    tail?.next = nil
    // Append tail to head
    return head!
  }
}


//: [Next](@next)
