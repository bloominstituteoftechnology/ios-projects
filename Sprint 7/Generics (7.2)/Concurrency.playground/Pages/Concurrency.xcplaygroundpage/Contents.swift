import Cocoa

var x = 42

let lock = NSLock()

DispatchQueue.concurrentPerform(iterations: 10) { (_) in
    //don't need locks for x += 1 because not reading value
    lock.lock()
    var scratch = x
    scratch += 1
    x = scratch
    lock.unlock()
}
print(x)
