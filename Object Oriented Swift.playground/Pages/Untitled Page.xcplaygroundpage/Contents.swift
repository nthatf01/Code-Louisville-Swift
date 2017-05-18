class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Machine {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(_ direction: String) {
        print("Do nothing! I'm a machine!")
    }
}

// Enter your code below

class Robot: Machine {
    override func move(_ direction: String) {
        switch direction {
        case "Up":
            self.location.y -= 1
        case "Down":
            self.location.y += 1
        case "Left":
            self.location.x -= 1
        case "Right":
            self.location.x += 1
        default:
            break
        }
    }
}