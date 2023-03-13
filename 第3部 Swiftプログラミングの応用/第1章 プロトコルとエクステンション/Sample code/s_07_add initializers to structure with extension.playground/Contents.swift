struct Circle {
    var radius = 1.0
    var area: Double {
        radius * radius * Double.pi
    }
}

let defaultCircle = Circle()
let menberwiseCircle = Circle(radius: 10)

extension Circle {
    init(diameter: Double) {
        self.init()
        self.radius = diameter / 2
    }

    init(circumference: Double) {
        let diameter = circumference / Double.pi
        // 元実装のメンバワイズ・イニシャライザを利用できる
        self.init(radius: diameter / 2)
    }
}

let largeCircle = Circle(diameter: 100)
largeCircle.radius

let unitCircle = Circle(circumference: Double.pi * 2)
unitCircle.radius

