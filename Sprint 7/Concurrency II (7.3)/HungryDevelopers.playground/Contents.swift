import UIKit

class Spoon {
    let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}

class Developer {
    
    var leftSpoon: String
    var rightSpoon: String
    
    init(leftSpoon: String, rightSpoon: String) {
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        
    }
    
    func think() {
        //pick both spoons before returning
        
    }
    
    func eat() {
        //shoud pause for random amount of time before putting both spoons down usleep()
        
    }
    
    func run() {
        
        
    }
    
}
