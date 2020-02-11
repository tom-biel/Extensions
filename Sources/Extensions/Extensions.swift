
import Foundation

struct Extensions {
    var text = "Hello, World!"
}


fileprivate enum Synchronization {
    static var Queues = Dictionary<String, DispatchQueue>()
}

public func synchronized(_ label:String, _ body: () -> Void) {

    var queue = Synchronization.Queues[label]
    if(queue == nil) {
        queue = DispatchQueue(label: label)
        Synchronization.Queues[label] = queue
    }

    queue!.sync(execute: body)
}
