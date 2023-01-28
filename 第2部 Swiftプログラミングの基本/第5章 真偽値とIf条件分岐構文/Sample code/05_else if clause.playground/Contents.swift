let number = 10

if number.isMultiple(of: 3) {
    print("Fizz")
} else {
    if number.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(number)
    }
}

