func diceRoll() -> Int {
    return Int.random(in: 1...6)
}

var number = diceRoll()
print("You got \(number).")

while number != 5 {
    number = diceRoll()
    print("You got \(number).")
}
