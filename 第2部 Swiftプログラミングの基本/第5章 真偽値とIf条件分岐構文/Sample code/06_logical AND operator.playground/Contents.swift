let number = 15

if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
    print("FizzBuzz")
} else if number.isMultiple(of: 3) {
    print("Fizz")
} else if number.isMultiple(of: 5) {
    print("Buzz")
} else {
    print(number)
}

let ten = 10
ten.isMultiple(of: 2) && ten.isMultiple(of: 5)  // true
ten.isMultiple(of: 2) && ten.isMultiple(of: 6)  // false
