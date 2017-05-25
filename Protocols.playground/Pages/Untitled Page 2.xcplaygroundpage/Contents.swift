//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


protocol Animal {
    var numberOfLegs: Int { get }
}

protocol Pet: Animal {
    var cuddlyName: String { get }
}
