import UIKit

var str = "Hello, playground"

func quickSort<T: Comparable>(array: [T]) -> [T] {
  if array.count == 0 {
    return array
  }
  
  let test = array.count / 2
  let pivot = array [test]
  print("\(array.count) / 2 = \(test)")
  
  let left = array.filter { $0 < pivot }
  let right = array.filter { $0 > pivot }
  let middle = array.filter { $0 == pivot }
  
  return quickSort(array: left) + middle + quickSort(array: right)
}

func binarySearch<T>(_ x: T, in array: [T] ) -> Bool where T: Comparable {
  var low = 0
  var high = array.count - 1
  var mid = -1
  
  while low <= high {
    mid = (low + high) / 2
    if x > array[mid] {
      low = mid + 1
    } else if x < array[mid] {
      high = mid - 1
    } else {
      return true
    }
  }
  return false
}

func recursiveBinarySearch<T>(_ x: T, in array: [T]) -> Bool where T: Comparable {
  return recursiveBinarySearch(x, in: array, low: 0, high: array.count - 1)
}

func recursiveBinarySearch<T>(_ x: T, in array: [T], low: Int, high: Int) -> Bool where T: Comparable {
  if low > high {
    return false
  }
  let mid = (low + high) / 2
  if x > array[mid] {
    return recursiveBinarySearch(x, in: array, low: mid + 1, high: high)
  } else if x < array[mid] {
    return recursiveBinarySearch(x, in: array, low: low, high: mid - 1)
  } else {
    return true
  }
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26, 90 ]

let sorted = quickSort(array: list)

binarySearch(6, in:  sorted) == false
binarySearch(27, in:  sorted) == true
binarySearch(-1, in:  sorted) == true
binarySearch(873873, in:  sorted) == false
binarySearch(5, in:  sorted) == true

recursiveBinarySearch(6, in:  sorted) == false
recursiveBinarySearch(27, in:  sorted) == true
recursiveBinarySearch(-1, in:  sorted) == true
recursiveBinarySearch(873873, in:  sorted) == false
recursiveBinarySearch(5, in:  sorted) == true

//sall test Array.count/ 2 will always return a rounded mumber :)
var doubleToInt = Int(2.9)

