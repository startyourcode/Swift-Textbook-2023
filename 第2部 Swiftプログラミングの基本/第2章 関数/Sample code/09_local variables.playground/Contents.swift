var currentPrice = 123.4

func update(amount: Double) {
    let previousPrice = currentPrice
    currentPrice += amount
    print("Updated from \(previousPrice) to \(currentPrice).")
}

update(amount: +1.5)
//previousPrice
