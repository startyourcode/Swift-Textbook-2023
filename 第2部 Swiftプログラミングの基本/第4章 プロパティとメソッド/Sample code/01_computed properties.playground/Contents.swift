struct EquilateralRectangle {
    var sideLength: Double
    
    var perimeter: Double {
        get {
            return sideLength * 4.0
        }
        set (newPerimeter) {
            sideLength = newPerimeter / 4.0
        }
    }
}

var rectangle = EquilateralRectangle(sideLength: 1.2)
rectangle.perimeter
rectangle.perimeter = 6
rectangle.sideLength
