

func area(length: Int, width: Int) -> Int {
    let areaOfRoom = length * width
    
    return areaOfRoom
}

let areaOfFirstRoom = area(length: 10, width: 12)

let areaOfSecondRoom = area(length: 20, width: 22)

func carpetCost(havingArea area: Int, carpetColor color: String) -> Int {

    var price = 0
    
    switch color {
        case "gray": price = area * 1
        case "tan": price = area * 2
        case "blue": price = area * 4
    default: price = 0
    }
    return price
}

carpetCost(havingArea: areaOfSecondRoom, carpetColor: "blue")