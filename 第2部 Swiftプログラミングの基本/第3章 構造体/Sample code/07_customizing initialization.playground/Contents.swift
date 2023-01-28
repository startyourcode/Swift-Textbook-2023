struct Circle {
    let radius: Double
    let diameter: Double
    
    init(r: Double) {
        radius = r
        diameter = r * 2
    }
    
    init() {
        radius = 1.0
        diameter = 2.0
    }
}

let circle = Circle(r: 2)
let unitCircle = Circle()
