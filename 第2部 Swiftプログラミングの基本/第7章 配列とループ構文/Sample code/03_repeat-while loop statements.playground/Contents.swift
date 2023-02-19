func diceRoll() -> Int {
    return Int.random(in: 1...6)
}

var number: Int

repeat {
    number = diceRoll()
    print("You got \(number).")
} while number != 1
