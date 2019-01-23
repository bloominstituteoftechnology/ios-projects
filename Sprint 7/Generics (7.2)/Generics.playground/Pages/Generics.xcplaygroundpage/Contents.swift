import UIKit

func exchangeInts(lhs: inout Int, rhs: inout Int) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

var a = 23
var b = 99
//exchangeInts(lhs: &a, rhs: &b)

print("\(a) + \(b)")


func exchange<Value>(lhs: inout Value, rhs: inout Value) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

exchangeInts(lhs: &a, rhs: &b)

print(a)
print(b)
