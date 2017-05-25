//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol FullNameable {
    var fullName: String { get }
}

struct User: FullNameable {
    var fullName: String
}

let user = User(fullName: "Nathaniel Hatfield")

struct Friend: FullNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Nathaniel", middleName: "Tavis", lastName: "Hatfield")

friend.fullName

import Foundation

enum EmployeeType {
    case manager
    case traditional
}

protocol Payable {
    func pay() -> Paycheck
}

struct Paycheck {
    let base: Double
    let benefits: Double
    let deductions: Double
    let vacation: Double
}

class Employee {
    let name: String
    let address: String
    let startDate: Date
    let type: EmployeeType
    
    init(name: String, address: String, startDate: Date, type: EmployeeType) {
        self.name = name
        self.address = address
        self.startDate = startDate
        self.type  = type
    }
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage = 15.00
    var hoursWorked = 0.0
    let vacation = 0
    
    func pay() -> Paycheck {
        let base = hoursWorked * hourlyWage
        return Paycheck(base: base, benefits: 0, deductions: 0, vacation: 0)
    }
}

class SalariedEmployee: Employee, Payable {
    var salary = 50000.00
    var benefits = 1000.00
    var deductions = 0.0
    var vacation = 2.0
    
    func pay() -> Paycheck {
        let monthly = salary / 12
        return Paycheck(base: monthly, benefits: benefits, deductions: deductions, vacation: vacation)
    }
}

func pay(employee: Payable) {
    employee.pay()
}

let employee = SalariedEmployee(name: "Nathaniel", address: "Louisville", startDate: Date(), type: .traditional)
pay(employee: employee)

//Loosely Related Types

protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm mush!")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
    func blend() {
        print("I haven't changed much at all!")
    }
}

func makeSmoothie(with ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
    }
}

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate")

let ingredients: [Blendable] = [strawberry, chocolateMilk]
makeSmoothie(with: ingredients)

