//: [Previous](@previous)

struct Queue<Element> {
    
    
    mutating func enqueue(_ value: Element) {
        items.append(value)
    }
    
    mutating func dequeue() -> Element? {
        if let first = items.first {
            items.remove(at: 0)
            return first
        } else {
            return nil
        }
    }
    
    mutating func clear(_ action: (Element) -> Void) {
        while let next = dequeue() {
            action(next)
        }
    }
    private var items: [Element] = []
    
    func map<T>(_ transformer: (Element) -> T) -> Queue<T> {
        var newQueue = Queue<T>()
    
    for item in items {
        let trasnformed = transformer(item)
    }
        return newQueue
}
    func forEach(_ action: (Element) -> Void) {
        for item in items {
            action(item)
        }
    }
}

var q = Queue<Int>()
var queueOfStrings = q.map{ "\($0 * 2)" }
queueOfStrings.forEach{ print("String: " + $0) }



