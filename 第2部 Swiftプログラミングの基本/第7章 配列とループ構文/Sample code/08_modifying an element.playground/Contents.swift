var fruits = ["🍎", "🥝", "🥝"]

fruits[0] = "Apple"
print(fruits)

//fruits[3] = "Orange"

fruits.firstIndex(of: "🥝")
fruits.lastIndex(of: "🥝")
fruits.firstIndex(of: "🍊")

if let indexOfFirstKiwi = fruits.firstIndex(of: "🥝") {
    fruits[indexOfFirstKiwi] = "Kiwi"
}
