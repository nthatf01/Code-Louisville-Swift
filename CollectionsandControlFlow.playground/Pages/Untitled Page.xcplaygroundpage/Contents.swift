//Collections and Control Flow

//Arrays

var todo: [String] = ["finish collections course", "Buy groceries", "Respond to emails"]
var numbers: [Int] = [1, 2, 3]

//Add new item to end of array using append method
todo.append("Pick up dry cleaning")

//Concatentating two arrays

[1,2,3] + [4]

todo = todo + ["Order book online"]

let firstTask = todo[0]
firstTask
let thirdTask = todo[2]

todo[4] = "Brush teeth"
todo[0] = "Watch Treehouse courses"

todo.insert("Watch TV", at: 2)

todo.remove(at: 2)
todo.count

//Dictionaries

var airportCodes: [String:String] = [
    "LGA":"La Guarida",
    "LHR":"Heathrow",
    "CDG":"Charles de Gaulle",
    "HKG":"Hong Kong International",
    "DXB":"Dubai International"
]

//Reading from a dictionary

airportCodes["LGA"]
airportCodes["SYD"] = "Sydney Airport"

airportCodes["LGA"] = "La Guardia International Airport"
airportCodes.updateValue("Dublin Airport", forKey: "DUB")

airportCodes["DXB"] = nil
airportCodes.removeValue(forKey: "CDG")

airportCodes

let newYorkAirport = airportCodes["LGA"]
