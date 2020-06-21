# [Merge sort](https://en.wikipedia.org/wiki/Merge_sort)

### Implementation

```
func mergerSort<T: Comparable>(_ array: [T]) -> [T] {
  // base case return if the array contains only one element
  if array.count == 1 { return array }
  let mid = array.count / 2
  let left = mergerSort(Array(array[..<mid]))
  let right = mergerSort(Array(array[mid..<array.count]))
  return merge(left, right)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  
  // keep pointer on array to merge
  var leftIndex = 0
  var rightIndex = 0
  
  var oredered:[T] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    if left[leftIndex] < right[rightIndex] {
      oredered.append(left[leftIndex])
      leftIndex += 1
    } else if left[leftIndex] > right[rightIndex] {
      oredered.append(right[rightIndex])
      rightIndex += 1
    } else {
      oredered.append(left[leftIndex])
      oredered.append(right[rightIndex])
      leftIndex += 1
      rightIndex += 1
    }
  }
  
  // At this point there is only items from only one array raminaing to merge
  
  // Add remaining from the left array
  while leftIndex < left.count {
    oredered.append(left[leftIndex])
    leftIndex += 1
  }
  
  // Add remaining from the right array
  while rightIndex < right.count {
    oredered.append(right[rightIndex])
    rightIndex += 1
  }
  
  return oredered
}
```