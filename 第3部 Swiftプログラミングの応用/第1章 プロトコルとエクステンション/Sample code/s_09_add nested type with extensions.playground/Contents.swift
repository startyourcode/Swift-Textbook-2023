struct Orange {
    let wight: Double
}

extension Orange {
    enum Grade {
        case extraLarge, large, regular, outOfSpec
    }
    var grade: Grade {
        switch self.wight {
        case let w where w > 180:
            return .extraLarge
        case let w where w > 130:
            return .large
        case let w where w > 80:
            return .regular
        default:
            return .outOfSpec
        }
    }
}

let smallOrange = Orange(wight: 80)
let regularOrange = Orange(wight: 80.2)
let largeOrange = Orange(wight: 180)
let extraLargeOrange = Orange(wight: 200)

smallOrange.grade       // out of spec
regularOrange.grade     // regular
largeOrange.grade       // large
extraLargeOrange.grade  // extra large
