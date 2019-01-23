//: [Previous](@previous)



infix operator <=>

func <=> <Value>(lhs: inout Value, rhs: inout Value) {
    let temp = lhs
    lhs = rhs
    rhs = temp
}

var t1 = 42
var t2 = 69

t1 <=> t2


