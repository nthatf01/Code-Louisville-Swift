/*
var todo: [String] = ["Finish collections course", "Buy groceries", "Check emails", "Pick up dry cleaning", "Order books online", "Mow the lawn"]

for task in todo {
    print(task)
}

//Closed ranges

for number in 1...10 {
    print("\(number) times 5 is equal to \(number *  5)")
}

var results: [Int] = []

for multiplier in 1...10 {
    results.append(multiplier * 6)
}

//var x = 0

//while x <= 20 {
//    print[x]
//    x += 1
//}

var index = 0

while index < todo.count {
    print(todo[index])
    index += 1
}

var counter = 1

repeat {
    print("I'm inside the repeat loop!")
    counter += 1
} while counter < 1
*/

for nums in 1...100 {
    //print(nums)
    if (nums % 3 == 0 && nums % 5 == 0) {
        print("FizzBuzz")
    } else if (nums % 3 == 0) {
        print("Fizz")
    } else if (nums % 5 == 0) {
        print("Buzz")
    } else {
        print(nums)
    }
    
}