import Foundation


final class ArrayList<T> {
  var store: [T?]
  var numberOfEl = 0
  
  subscript(index: Int) -> T? {
    get {
      if index >= capacity() { return nil }
      return store[index]
    }
    set (newValue) {
      if index >= capacity() { return  } // should trow
      store[index] = newValue
    }
  }
  
  init(size: Int) {
    store = [T?](repeating: nil, count: size)
  }
  
  
  func append(_ value: T) {
    if Int(count()) == capacity() {
      print("Resizing array...")
      let storeTmp = store
      store = [T?](repeating: nil, count: capacity() * 2)
      var i = 0
      while i < storeTmp.count {
        store[i] = storeTmp[i]
        i += 1
      }
    }
    store[count()] = value
    numberOfEl += 1
  }
  
  func capacity() -> Int {
    return store.count
  }
  
  func count() -> Int {
    return numberOfEl
  }
}

var arrayList = ArrayList<Int>(size: 2)
arrayList.append(10)
arrayList.append(7)
arrayList.append(289)
arrayList.append(2)
arrayList.append(3767)
arrayList.append(1673)
print("Array contains \(arrayList.count()) can go up to \(arrayList.capacity())")
arrayList.append(7)
arrayList.append(289)
arrayList.append(2)
arrayList.append(3767)
arrayList.append(1673)
print("Array contains \(arrayList.count()) can go up to \(arrayList.capacity())")

arrayList[0] = 15
print("Array 0 == \(arrayList[0])")

