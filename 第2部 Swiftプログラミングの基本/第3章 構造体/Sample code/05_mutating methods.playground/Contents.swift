struct Stock {
    var previousPrice = 0.0
    var currentPrice: Double
    
    mutating func update(amount: Double) {
        previousPrice = currentPrice
        currentPrice += amount
    }
}

var appleStock = Stock(currentPrice: 123.45)
appleStock.update(amount: 1.11)

let goggleStock = Stock(currentPrice: 86.56)
//goggleStock.update(amount: 2.34)
