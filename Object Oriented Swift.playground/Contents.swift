let x1 = 0
let y1 = 0

let coordinate1: (x: Int, y: Int) = (0,0)

coordinate1.x

struct Point{
    let x: Int
    let y: Int
    
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

