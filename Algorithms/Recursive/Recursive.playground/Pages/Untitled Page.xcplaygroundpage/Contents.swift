import UIKit

final class Solution {
  var cache: [Int: Int] = [:]
  func fib(_ x: Int) -> Int {
    if x <= 1 {
      return x
    }
    var cached1: Int?
    var cached2: Int?
    if (cache[x - 1] != nil) {
      cached1 = cache[x - 1]!
    } else {
      cached1 = fib(x - 1)
      cache[x - 1] = cached1!
    }
    
    if (cache[x - 2] != nil) {
       cached2 = cache[x - 2]!
    } else {
      cached2 = fib(x - 2)
      cache[x - 2] = cached2!
    }
    
 
    return cached1! + cached2!
  }
}

Solution().fib(0)
Solution().fib(1)
Solution().fib(2)
Solution().fib(3)
Solution().fib(8)
