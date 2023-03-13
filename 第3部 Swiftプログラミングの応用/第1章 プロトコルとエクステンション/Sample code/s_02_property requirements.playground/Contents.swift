import Darwin

protocol Shape {
    var area: Double { get }
}

struct Rectangle: Shape {
    let width, height: Double
    var area: Double {
        return width * height
    }
}

struct Circle: Shape {
    var rarius = 1.0
    var area: Double {
        get {
            return rarius * rarius * Double.pi
        }
        set {
            rarius = sqrt(newValue / Double.pi)
        }
    }
}

