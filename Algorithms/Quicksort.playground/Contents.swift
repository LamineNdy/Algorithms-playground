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

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26, 90 ]

let sorted = quickSort(array: list)

indirect enum BinarySearchTree<T> {
  case empty
  case node(BinarySearchTree, T, BinarySearchTree)
}


var doubleToInt = Int(2.9)

