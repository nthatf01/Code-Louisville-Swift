let x1 = 0
let y1 = 0

let coordinate1: (x: Int, y: Int) = (0,0)

coordinate1.x

struct Point{
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    /// Returns the surrounding points in range of
    /// the current one
    func surroundingPoints(inRange range: Int = 1) -> [Point] {
        var results = [Point]()
        
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange {
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange {
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        
        return results
    }
}

let coordinatePoint = Point(x: 0, y: 0)

coordinatePoint.x
coordinatePoint.surroundingPoints()

class Enemy {
    var life: Int = 2
    let position: Point
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func decreaseLife(by factor: Int) {
        life -= factor
    }
}

class SuperEnemy: Enemy {
    
    let isSuper: Bool = true
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: x)
        self.life = 50
    }
}

class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func fire(at enemy: Enemy) {
        if isInRange(of: enemy) {
            enemy.decreaseLife(by: strength)
            print("Gotcha")
        } else {
            print("Out of Range")
        }
    }
    
    func isInRange(of enemy: Enemy) -> Bool {
        let availablePositions = position.surroundingPoints(inRange: range)
        
        for point in availablePositions {
            if point.x == enemy.position.x && point.y == enemy.position.y {
                return true
            }
        }
        
        return false
    }
}

class LaserTower: Tower {
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.range = 100
    }
    
    override func fire(at enemy: Enemy) {
        while enemy.life >= 0 {
            enemy.decreaseLife(by: strength)
        }
        
        print("Enemy destroyed!")
    }
    
}

let tower = Tower(x: 0, y: 0)
let enemy = Enemy(x: 1, y: 1)
let superEnemy = SuperEnemy(x: 3, y: 2)
let laserTower = LaserTower(x: 2, y: 2)

tower.fire(at: enemy)
//tower.fire(at: SuperEnemy)

struct Tag {
    let name: String
}

struct Post {
    let title: String
    let author: String
    let tag: Tag
    
    func description() -> String {
        print("\(title) by \(author). Filed under \(tag.name)")
        return ("\(title) by \(author). Filed under \(tag.name)")
    }
}

let post = Tag(name: "Swift")
let firstPost = Post(title: "iOS Development", author: "Apple", tag: post)
let postDescription = firstPost.description()