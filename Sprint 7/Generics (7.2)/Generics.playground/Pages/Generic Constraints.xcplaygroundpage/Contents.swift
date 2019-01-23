
infix operator **

//func powerInt(base: Int, exponent: Int) -> Int {
//    var result = 1
//    for _ in 0 ..< exponent {
//        result *= base
//    }
//    return result
//}

//powerInt(base: 2, exponent: 3)

//func ** <Number>(base: Number, exponent: UInt) -> Number where Number: Numeric {
//    var result: Number = 1
//    for _ in 0 ..< exponent {
//        result *= base
//    }
//    return result
//}
//
//2 ** 5

extension Numeric {
    static func ** (base: Self, exponent: UInt) -> Self {
        return base.raise(to: exponent)
    }
    
    func raise(to power: UInt) -> Self {
        var result: Self = 1
        for _ in 0 ..< power {
            result *= self
        }
        return result
    }
}
