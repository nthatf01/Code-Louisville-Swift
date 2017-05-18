struct User {
    var fullName: String
    var email: String
    var age: Int
}

var someUser = User(fullName: "Nathaniel Hatfield", email: "nthatfield@gmail.com", age: 32)

var anotherUser = someUser

class Person {
    var fullName: String
    var email: String
    var age: Int
    
    init(name: String, email: String, age: Int) {
        self.fullName = name
        self.email = email
        self.age = age
        
    }
}

var somePerson = Person(name: "Tim Cook", email: "tim.cook@apple.com", age: 54)