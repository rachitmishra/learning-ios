import UIKit

func swap<T>(a: inout T, b: inout T) {
    let temp = b
    b = a
    a = temp
}

var a = "A"
var b = "B"

swap(&a, &b)
print("\(a) \(b)")

class List<T>: CustomStringConvertible {
    
    var description: String {return items.description } 
    
    
    var items = [T]()
    
    func add(item: T) -> Bool {
        items.append(item)
        return true
    }
}

let intList = List<Int>()
intList.add(item: 1)

print(intList)



