//Binary Operators

let height: Double = 12 // in feet
let width: Double = 10 // in ft

let area = height * width // Area in sq feet

//1 sq meter = 1 sq foot / 10.764

let areaInMeters = area/10.764

// Equals Operator

let string1 = "Hello!"
let string2 = "Hello!"
let string3 = "hello"

string1 == string2
string1 == string3

// Not equal

string1 != string2
string1 != string3

// Greater than

1 > 2
2 > 1

"a" > "b"
"b" > "a"
"A" > "a"

let a = 200
let b = 5
let c = a % b
let d = c == 0

//Operator Precedence

var x = 100 + 100 - (((5 * 2) / 3) % 7)

//Unary Operators

var levelScore = 0
levelScore = levelScore + 1
levelScore += 1
levelScore -= 1

//NOT Operator

let on = true
let off = !on

